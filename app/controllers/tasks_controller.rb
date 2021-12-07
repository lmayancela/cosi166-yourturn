# frozen_string_literal: true

require 'byebug'
require 'activerecord-import'

class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update]

  def new
    @task = Task.new
    @users = current_user.house.users
  end

  def create
    params = task_params
    due_date = "#{params['due_date(1i)']}/#{params['due_date(2i)']}/#{params['due_date(3i)']}"
    @task = Task.new(name: params['name'], description: params['description'], priority: params['priority'], due_date: due_date, house_id: current_user.house.id)
    if @task.save
      task_records = create_records(@task.id, params['users'] - [''])
      TaskRecord.import(task_records)
      flash[:success] = "Your task #{@task.name} is uploaded!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @users = current_user.house.users
  end

  def update
    params = task_params
    due_date = "#{params['due_date(1i)']}/#{params['due_date(2i)']}/#{params['due_date(3i)']}"
    TaskRecord.where(task_id: @task.id).delete_all
    task_records = create_records(@task.id, params['users'] - [''])
    @task.update(:name => params['name'], :description => params['description'], :priority => params['priority'], :due_date => due_date)
    TaskRecord.import(task_records)
    flash[:success] = "Your task #{@task.name} is updated!"
    redirect_to root_url
  end

  private

  def create_records(task_id, user_ids)
    records = []
    user_ids.each do |id|
      records << TaskRecord.new(task_id: task_id, user_id: id)
    end
    records
  end

  def task_params
    params.require(:task).permit(:name, :description, :priority, :due_date, users: [])
  end

  def set_task
    @task = Task.find params[:id]
  end

end
