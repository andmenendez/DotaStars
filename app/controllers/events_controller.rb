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

    if @event.save
      flash[:success] = "EVENT '#{@event.title}' CREATED"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    flash[:success] = "EVENT '#{@event.title}' UPDATED"
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:alert] = "EVENT DELETED"
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
