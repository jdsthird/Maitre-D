module SeatingHelper

  # aggregate guests into collections
  def group_guests(guests)
    guests.map do |guest|
      
    end
  end

  # generate permutations of collections
  def check_permutations(collections, tables)
    collections.permutation.each do |permutation|
      guests = permutation.flatten
      tables = seat_guests(tables, guests)
      if tables_valid?(tables)
        return tables
      else
        false
      end
    end
  end

  # map guests to tables based upon generated permutations
  def seat_guests(tables, guests)
    tables.map do |table|
      table.number_of_seats.times do
        table.guests << guests.shift
      end
      table
    end
    tables
  end
  # run a method on each table to ensure it meets the requirements
  def tables_valid?(tables)
    tables.all? { |table| table.valid? }
  end
end