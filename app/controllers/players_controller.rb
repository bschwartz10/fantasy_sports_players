class PlayersController < ApplicationController

  def index
    @players = Player.get_all
  end

  def show
    @player = Player.find(params[:id])
  end

end
