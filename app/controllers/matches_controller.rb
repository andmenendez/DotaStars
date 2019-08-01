class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    @event = Event.find(@match.event_id)
    @radiant = Team.find(@match.radiant_id)
    @dire = Team.find(@match.dire_id)  
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      flash[:success] = "MATCH CREATED"
      redirect_to event_path(@match.event_id)
    else
      render 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @match.update(match_params)

    flash[:success] = "MATCH UPDATED"

    redirect_to match_path(@match)
  end

  def destroy
    @match = Match.find(params[:id])
    @event = @match.event_id
    @match.destroy
    flash[:alert] = "MATCH DELETED"
    redirect_to event_path(@event)
  end

  def getDire
    Team.find(self.dire_id)
  end

  def getRadiant
    Team.find(self.radiant_id)
  end

  def getName
    self.getDire.name + " vs " + self.getRadiant.name
  end

  private
    def match_params
      params.require(:match).permit(
                :event_id,
                :radiant_id,
                :dire_id,
                :date_start)
    end
end


#app taking in radiant_id as team_id