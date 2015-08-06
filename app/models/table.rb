class Table < ActiveRecord::Base
	has_many :guests
	belongs_to :event

	validates_presence_of :number_of_seats
	validates_presence_of :event
end
