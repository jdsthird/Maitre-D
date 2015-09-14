class SeatingChartGenerator
  attr_accessor :tables, :num_seats, :collections

  def initialize(args)
    @tables = args[:tables]
    @num_seats = @tables.first.number_of_seats
    @collections = args[:collections].map { |collection| collection.guest_ids }.to_a
  end

  def make_seating_chart
    slices = []
    collections.each do |collection|
      added = false
      slices.length.times do |slice_index|
        if slices[slice_index].length + collection.length <= self.num_seats
          slices[slice_index] += collection
          added = true
          break
        end
      end
      slices << collection unless added
    end
    slices.each_with_index do |slice, index|
      self.tables[index].guest_ids = slice
    end
    self.tables
  end

  
  # private
  #   def isolate_collections
  #     collections = []
  #     prioritized_guests = self.guests.sort do |a,b|
  #       b.pair_ids.length <=> a.pair_ids.length
  #     end
  #     p prioritized_guests.map{|g| g.pair_ids.length}
  #     prioritized_guests.each do |guest|
  #       added = false
  #       collections.each do |collection|
  #         unless (guest.pair_ids & collection).empty?
  #           collection << guest.id
  #           added = true
  #           break
  #         end
  #       end
  #       collections << [guest.id] unless added
  #     end
  #     collections.sort { |a,b| b.length <=> a.length }
  #   end
end