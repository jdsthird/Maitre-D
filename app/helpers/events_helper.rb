module EventsHelper
  def current_event
    @current_event ||= Event.find_by_id(session[:event_id])
  end

  def update_current_event(event)
    @current_event = event
    session[:event_id] = event.id
  end
end
