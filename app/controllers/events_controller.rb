class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save

    # flash.notice = "Event '#{@event.title}' Created!"

    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash.notice = "Team Removed"
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(
                      :title,
                      :description,
                      :date_start,
                      :date_end,
                      :image)
    end
end
