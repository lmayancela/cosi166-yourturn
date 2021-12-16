# frozen_string_literal: true

class HousesController < ApplicationController
  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params.merge({ user_id: current_user.id }))
    if @house.save
      current_user.update(house_id: @house.id)
      flash[:success] = 'Welcome to Your New Home!'
      redirect_to current_user
    else
      render 'new'
    end

    # create appliances for new house
    Appliance.create(name: 'Washing Machine', house_id: @house.id, user_id: -1, used: false)
    Appliance.create(name: 'Dryer', house_id: @house.id, user_id: -1, used: false)
    Appliance.create(name: 'Dishwasher', house_id: @house.id, user_id: -1, used: false)
    Appliance.create(name: 'Sink', house_id: @house.id, user_id: -1, used: false)
    Appliance.create(name: 'Vacuum', house_id: @house.id, user_id: -1, used: false)
    Appliance.create(name: 'Stove', house_id: @house.id, user_id: -1, used: false)
  end

  private

  def house_params
    params.require(:house).permit(:name)
  end
end
