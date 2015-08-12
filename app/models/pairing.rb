class Pairing < ActiveRecord::Base
  belongs_to :guest
  belongs_to :pair, class_name: "Guest"
  belongs_to :twin, class_name: :Pairing

  validates_presence_of :guest
  validates_presence_of :pair


	def self.generate_pair(prams)
		pairing = Pairing.create(prams)
		guest = pairing.guest
		pair = pairing.pair
		other_pairing = Pairing.create(guest: pair,
																	pair: guest, 
																	twin: pairing)
		pairing.twin = other_pairing
		pairing.save
	end

end
