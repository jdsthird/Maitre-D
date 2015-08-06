class Table < ActiveRecord::Base
	has_many :guests
	belongs_to :event
	
end
