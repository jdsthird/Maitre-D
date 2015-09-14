module EventsHelper
  def current_event
    @current_event ||= Event.find_by_id(session[:event_id])
  end

  def update_current_event(event)
    @current_event = event
    session[:event_id] = event.id
  end

  def guests_seated?(guests)
    guests.all? do |guest|
      guest.table != nil
    end
  end

  def seat_guests(tables, collections)
    scg = SeatingChartGenerator.new(tables: tables, collections: collections)
    full_tables = scg.make_seating_chart
    if full_tables
      full_tables.each(&:save)
    end
  end
end
