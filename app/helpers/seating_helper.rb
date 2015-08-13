module SeatingHelper

  def check_sufficient_seating(tables, guests)
    total_seats = tables.reduce(0) { |sum, table| sum += table.number_of_seats }
    total_seats - guests.length >= 0
  end

end