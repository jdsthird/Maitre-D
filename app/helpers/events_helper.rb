module EventsHelper
  def current_event
    @current_event ||= Event.find_by_id(session[:event_id])
  end
end
