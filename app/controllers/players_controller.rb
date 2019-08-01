class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.save
  end

  def destroy
    @player = Player.find(params[:id])
    @team = @player.team_id
    @player.destroy

    flash[:alert] = "PLAYER REMOVED"

    redirect_to edit_team_path(@team)
  end
  
  def update
    
    @player = Player.find(params[:id])
    @player.update(player_params)

    flash[:success] = "ROSTER UPDATED"

  end

  private
    def player_params
      params.require(:player).permit(:name, :position, :team_id)
    end
end
