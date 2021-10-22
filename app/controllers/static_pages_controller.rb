class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @houses = House.all
  end

  def house_appliance
  end

  def billing
  end

  def setting
  end

  def contact
  end
end
