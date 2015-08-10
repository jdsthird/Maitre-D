module EventsHelper

	def current_event
		@current_event ||= Event.find(session[:event_id])
	end

	def set_event(event)
		session[:event_id] = event.id
	end

	def has_event?
		!current_event.nil?
	end

end
