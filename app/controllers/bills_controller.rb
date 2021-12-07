# frozen_string_literal: true

require 'byebug'

class BillsController < ApplicationController
  def new
    @bill = Bill.new
    @users = current_user.house.users
  end

  def create
    params = bill_params
    due_date = "#{params['due_date(1i)']}/#{params['due_date(2i)']}/#{params['due_date(3i)']}"
    @bill = Bill.new(name: params['name'], amount: params['amount'], due_date: due_date)
    if @bill.save
      bill_records = create_records(@bill.id, params['users'] - [''])
      BillRecord.import(bill_records)
      flash[:success] = "Your bill for #{@bill.name}is uploaded!"
      redirect_to current_user
    else
      render 'new'
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
    params.require(:bill).permit(:name, :amount, :due_date, users: [])
  end
end
