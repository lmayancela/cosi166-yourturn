# frozen_string_literal: true

require 'byebug'

class BillsController < ApplicationController
  def new
    @bill = Bill.new
    @users = current_user.house.users
  end

  def show
    @bill = Bill.find(params["id"])
  end
  

  def pay
    bill = Bill.find(params['id'])
    pay_amount = bill.amount.to_f * 100
    pay_amount = pay_amount.to_i
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: bill.name,
        amount: pay_amount,
        currency: 'usd',
        quantity: 1,
      }],
      payment_intent_data: {
        application_fee_amount: 0,
      },
      mode: 'payment',
      success_url: 'http://127.0.0.1:3000/success/'+ bill.id.to_s,
      cancel_url: 'http://127.0.0.1:3000/billing',
    }, {stripe_account: User.find(bill.creator_id).uid})

    redirect_to session.url
  end

  def create
    params = bill_params
    due_date = "#{params['due_date(1i)']}/#{params['due_date(2i)']}/#{params['due_date(3i)']}"
    share = params['amount'].to_f/current_user.house.users.length
    share = share.floor(2).to_s
    @bill = Bill.new(name: params['name'], amount: share, users: current_user.house.users, due_date: due_date, creator_id: current_user.id)
    if @bill.save
      b = Bill.find(@bill.id)
      b.thumbnail = params['thumbnail']
      b.save
      flash[:success] = "Your bill for #{@bill.name}is uploaded!"
      redirect_to billing_detail_path
    else
      render 'new'
    end
  end

  def destroy
    bill = Bill.find(params["id"])
    bill.bill_record.each do |record|
      record.destroy
    end
    bill.destroy
    respond_to do |format|
      format.html { redirect_to billing_detail_path, notice: "Bill was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private

  def create_records(bill_id, user_ids)
    records = []

    user_ids.each do |id|
      records << BillRecord.new(bill_id: bill_id, user_id: id)
    end

    records
  end
  
  def bill_params
    params.require(:bill).permit(:name, :amount, :due_date, :thumbnail)
  end
end
