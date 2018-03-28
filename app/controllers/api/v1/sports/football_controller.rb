class Api::V1::Sports::FootballController < ApplicationController

  def index
    render json: Player.where(sport: 'football')
  end


end
