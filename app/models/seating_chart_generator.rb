class SeatingChartGenerator
  attr_accessor :tables, :num_seats, :pairs_hash

  def initialize(args)
    @tables = args[:tables]
    @guests = args[:guests]
    @num_seats = @tables.first.number_of_seats
    @pairs_hash = generate_pairs_hash(args[:guests])
  end

  def make_seating_chart
    guest_ids = self.pairs_hash.keys
    guest_ids.permutation.each do |seating_order|
      possibility = table_slices(num_seats, seating_order)
      if slices_valid?(possibility)
        possibility.each_with_index do |table_slice, slice_index|
          tables[slice_index].guest_ids = table_slice
        end
        return tables
      end
    end
    false
  end

  # map guests to tables based upon generated permutations
  def table_slices(num_seats, guest_ids)
    guest_ids.each_slice(num_seats).to_a
  end

  # run a method on each table to ensure it meets the requirements
  def slices_valid?(slice_array)
    slice_array.all? do |slice|
      slice_valid?(slice)
    end
  end

  def slice_valid?(slice)
    slice.all? do |guest_id|
      p missing_pairs = (pairs_hash[:guest_id] - slice)
      missing_pairs.empty?
    end
  end

  private
    def generate_pairs_hash(guests)
      output = Hash.new([])
      guests.each do |guest|
        output[guest.id] = guest.pair_ids
      end
      output
    end
end