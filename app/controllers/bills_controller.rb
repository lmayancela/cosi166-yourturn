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
  
  def create
    params = bill_params
    due_date = "#{params['due_date(1i)']}/#{params['due_date(2i)']}/#{params['due_date(3i)']}"
    @bill = Bill.new(name: params['name'], amount: params['amount'], due_date: due_date)
    if @bill.save
      b = Bill.find(@bill.id)
      b.thumbnail = params['thumbnail']
      b.save
      bill_records = create_records(@bill.id, params['users'] - [''])
      BillRecord.import(bill_records)
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
    params.require(:bill).permit(:name, :amount, :due_date, :thumbnail, users: [])
  end
end
