class SeatingController < ApplicationController
  def seat_guests
    if current_event == Event.find_by_id(params[:id])
      tables = current_event.tables
      guests = current_event.guests
      check_sufficient_seating(tables, guests)
    end
  end
end