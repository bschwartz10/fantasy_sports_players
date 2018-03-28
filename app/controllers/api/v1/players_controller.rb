class Api::V1::PlayersController < ApplicationController

  def show
    render json: Player.find(params[:id])
  end

end
