# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.authenticate(params[:session][:password])
      puts("--------------------------------------------")
      puts("logging in...")
      reset_session
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination。'
      render 'new'
    end
  end

  def destroy
    puts("--------------------------------------------")
    puts("logging out...")
    log_out
    redirect_to root_url
  end
end
