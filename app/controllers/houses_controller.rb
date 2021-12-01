# frozen_string_literal: true

class HousesController < ApplicationController
  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params.merge({ user_id: current_user.id}))
    if @house.save
      current_user.update(house_id: @house.id)
      flash[:success] = 'Welcome to Your New Home!'
      redirect_to current_user
    else
      render 'new'
    end
  end


  private

  def house_params
    params.require(:house).permit(:name)
  end

end
