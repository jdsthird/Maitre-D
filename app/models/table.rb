class Table < ActiveRecord::Base
	has_many :guests
  belongs_to :event

  validates_presence_of :number_of_seats
  validates_presence_of :event


  ######    Class   #######
  
  def self.set_table(seats, table_number, event)
    Table.create(number_of_seats: seats,
                 number:          table_number,
                 event:            event)
  end

  ######    Instance   #######
  def valid_seating?
    !self.overflowing? && guests_happy?
  end

  def overflowing?
    self.guests.length > self.number_of_seats
  end

  def guests_happy?
    self.guests.all? do |guest|
      guest.happy?(self.guests)
    end
  end

end
