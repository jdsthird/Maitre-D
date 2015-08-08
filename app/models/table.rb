class Table < ActiveRecord::Base
	has_many :guests
	belongs_to :event

	validates_presence_of :number_of_seats
	validates_presence_of :event

  def valid?
    !self.overflowing? && guests_happy?
  end

  def overflowing?
    self.guests.count <= self.number_of_seats
  end

  def guests_happy?
    self.guests.all? do |guest|
      guest.happy?(self.guests - guest)
    end
  end
end
