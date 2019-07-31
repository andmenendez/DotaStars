module EventsHelper
  def getEventMonth(event)
    event.date_start.strftime("%b") 
  end

  def getEventDay(event)
    event.date_start.strftime("%d")
  end

end
