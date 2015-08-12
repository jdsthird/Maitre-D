class SeatingController < ApplicationController
  def seat_guests
    if current_event == Event.find_by_id(params[:id])
      tables = current_event.tables
      guests = current_event.guests
      unless check_sufficient_seating(tables, guests)
        event.errors.add(:seating, "must be sufficient for the number of guests.")
        redirect_to event
      end
      scg = SeatingChartGenerator.new(tables: tables, guests: guests)
      full_tables = scg.make_seating_chart
      if full_tables
        full_tables.each(&:save)
      end
      redirect_to current_event
    end
  end
end