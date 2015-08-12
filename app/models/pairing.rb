class Pairing < ActiveRecord::Base
  belongs_to :guest
  belongs_to :pair, class_name: "Guest"

  validates_presence_of :guest
  validates_presence_of :pair

  after_create :check_and_make_pair

	def self.filter_symmetric_pairings(pairings) 
    pairings.map! do |pairing|
      pairings.delete(pairing.twin)
      pairing
    end
    pairings
  end

  def twin
		@twin ||= Pairing.find_by(guest_id: self.pair_id, pair_id: self.guest_id)
	end

	private

    def check_and_make_pair
      unless twin
        Pairing.create!(guest_id: self.pair_id, pair_id: self.guest_id)
      end
    end
end
