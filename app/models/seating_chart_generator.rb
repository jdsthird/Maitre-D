class SeatingChartGenerator
  attr_accessor :tables, :guests, :num_seats, :collections

  def initialize(args)
    @tables = args[:tables]
    @guests = args[:guests]
    @num_seats = @tables.first.number_of_seats
    @collections = isolate_collections
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

  
  private
    def isolate_collections
      collections = []
      self.guests.each do |guest|
        added = false
        collections.each do |collection|
          unless (guest.pair_ids & collection).empty?
            collection << guest.id
            added = true
            break
          end
        end
        collections << [guest.id] unless added
      end
      collections.sort { |a,b| b.length <=> a.length }
    end
end