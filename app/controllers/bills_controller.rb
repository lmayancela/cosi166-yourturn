# frozen_string_literal: true

require 'byebug'

class BillsController < ApplicationController
  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save && BillRecord.create!(bill_id: @bill.id, user_id: current_user.id)
      flash[:success] = "Your bill for #{@bill.name}is uploaded!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :amount, :due_date)
  end
end
