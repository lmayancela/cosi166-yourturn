require 'json'

class StaticPagesController < ApplicationController
  def home
    @tasks_test = extract_valid_dates
    @date = Date.today
  end

  def house_appliance
  end

  def billing
  end

  def setting
  end

  def contact
  end

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
    users_per_task = Hash.new
    puts "----------------------------------------------"

    tasks.each do |task|
      puts task
      id = task.id
      users = task.users
      users_per_task[id] = users
    end

    puts JSON.pretty_generate(users_per_task)

    return users_per_task
  end

  def get_tasks(ids)
    ids_arr = ids.split('-')
    tasks = Task.find(ids_arr)

    return tasks
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
    Task.find_each do |task|
      task_date = Date.parse(task.due_date.to_s)
      days_apart = (task_date - curr_date).to_i
      if days_apart.between?(0,7)
        tasks_per_day[days_apart] << task.id
      end
    end

    return tasks_per_day
  end

end
