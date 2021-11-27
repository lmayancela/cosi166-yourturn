# frozen_string_literal: true

class AppliancesController < ApplicationController
  def index
    @appliances = Appliance.all
  end

  def update
    @appliance = Appliance.find_by(id: params[:id])
    if @appliance.used == false
      puts 'fwefwefwe'
      puts current_user.id
      @appliance.update(used: true, user_id: current_user.id)
    else
      @appliance.update(used: false, user_id: -1)
      puts 'fwefwefwe'
      puts current_user.id
    end
    redirect_to appliances_path
  end

  private

    # Only allow a list of trusted parameters through.
    def appliance_params
      params.require(:appliance).permit(:name, :house_id, :user_id, :used)
    end
end
