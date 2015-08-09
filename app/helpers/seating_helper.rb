module SeatingHelper

  # aggregate guests into collections
  # def group_guests(guests)
  #   collections = []
  #   guests.sort! { |guest| guest.pairs.length }
  #   no_change = false
  #   until guests.empty?
  #     collections << [guests.shift]
  #     until no_change
  #       no_change = true
  #       collections.map! do |collection|
  #         expanded_collection = collection.map do |guest|
  #           collection += guest.pairs
  #           collection.uniq
  #         end
  #         if expanded_collection == collection
  #           collection
  #         else
  #           no_change = false
  #           expanded_collection
  #         end
  #       end
  #     end
  #     guests -= collections.flatten
  #   end
  #   collections
  # end

  # generate permutations of collections
  def check_permutations(guests, tables)
    guests.permutation.each do |permutation|
      # guests = permutation.flatten
      tables = seat_guests(tables, guests)
      if tables_valid?(tables)
        return tables
      end
    end
    false
  end

  # map guests to tables based upon generated permutations
  def seat_guests(tables, guests)
    number_of_seats = tables.first.number_of_seats
    unless tables.all? { |table| table.number_of_seats == number_of_seats }
      raise ArgumentError.new("all tables must have an equal number of seats")
    end
    groups = guests.each_slice(number_of_seats).to_a
    groups.each_with_index do |group, index|
      tables[index].guests << group
    end
    tables
  end
  # run a method on each table to ensure it meets the requirements
  def tables_valid?(tables)
    tables.all? { |table| table.valid_seating? }
  end
end