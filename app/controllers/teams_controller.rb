class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new()
  end

  def create
    @team = Team.new(team_params)
    @team.save
    create_scaffold_roster(@team)
    
    redirect_to team_path(@team)
  end

  def update_roster
    @team = Team.find(params[:format])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)


      flash.notice = "Team '#{@team.name}' Updated!"
  end
  
  def create_standin
    @team = Team.find(params[:format])
    Player.create(name: "StandIn", position: "0", team_id: params[:format].to_i)
    redirect_to update_roster_teams_path(@team)
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash.notice = "Team Removed"
    redirect_to teams_path
  end

  private
    def team_params
      params.require(:team).permit(:name, :image)
    end

    def create_scaffold_roster(team) 
      5.times do |i|
        Player.create(
          name: "StandIn",
          team_id: team.id,
          position: "P#{i+1}")
        puts i
      end
    end

end
