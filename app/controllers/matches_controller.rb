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
    @match.save

    # flash.notice = "Event '#{@event.title}' Created!"

    redirect_to event_path(@match.event_id)
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