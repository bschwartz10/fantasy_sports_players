class Api::V1::Sports::BasketballController < ApplicationController

  def index
    render json: Player.where(sport: 'basketball')
  end


end
