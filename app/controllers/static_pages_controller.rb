class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @houses = House.all
  end

  def appliance
  end

  def bill
  end

  def setting
  end
end
