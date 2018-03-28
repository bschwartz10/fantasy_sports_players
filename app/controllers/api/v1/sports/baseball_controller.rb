class Api::V1::Sports::BaseballController < ApplicationController

  def index
    render json: Player.where(sport: 'baseball')
  end


end
