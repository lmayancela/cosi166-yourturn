# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params.merge({ house_id: 1 })) # Not the final implementation!
    if @user.save
      reset_session
      log_in @user
      flash[:success] = 'Welcome to YourTurn!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:house_id))
      flash[:success] = "Welcome to #{@user.house.name}!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
