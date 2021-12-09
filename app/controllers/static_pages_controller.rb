# frozen_string_literal: true

require 'json'

class StaticPagesController < ApplicationController
  def intro; end

  def home
    if current_user.nil?
      render 'intro'
    else
      @tasks_test = extract_valid_dates
      @date = Date.today
    end
  end

  def billing
    @balance = 0.0

    current_user.bills.each do |bill|
      if bill.creator_id.to_i != current_user.id
        @balance += bill.amount.to_f/current_user.house.users.length
      end
    end
    
    @balance
  end

  def success   
    bill = Bill.find(params["id"])

    bill.bill_record.each do |record|

      if record.user.id == current_user.id
        puts "destroyed"
        record.destroy
      end
    end
  end

  def billing_detail
    @bills = {}
    current_user.house.users.each do |user|

      @bills[user] = []
      user.bills.each do |bill|
        if bill.creator_id.to_i == user.id
          @bills[user] << bill
        end
      end
    end
    @bills
  end

  def setting; end

  def contact; end

  def display
    @tasks = get_tasks(params[:ids])
    @date = Date.parse(params[:date])
    @users = get_task_users(@tasks)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def get_task_users(tasks)
    users_per_task = {}
    puts '----------------------------------------------'

    tasks.each do |task|
      puts task
      id = task.id
      users = task.users
      users_per_task[id] = users
    end

    puts JSON.pretty_generate(users_per_task)

    users_per_task
  end

  def get_tasks(ids)
    ids_arr = ids.split('-')
    Task.find(ids_arr)
  end

  def extract_valid_dates
    tasks_per_day = {
      0 => [],
      1 => [],
      2 => [],
      3 => [],
      4 => [],
      5 => [],
      6 => [],
      7 => []
    }

    curr_date = Date.today
    tasks = current_user.house.tasks
    tasks.each do |task|
      task_date = Date.parse(task.due_date.to_s)
      days_apart = (task_date - curr_date).to_i
      tasks_per_day[days_apart] << task.id if days_apart.between?(0, 7)
    end

    tasks_per_day
  end
end
