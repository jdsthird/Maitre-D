class PairingsController < ApplicationController

	def index
		@guestList = current_event.guests
	end

	def create
		pairing = Pairing.new(pairing_params)
		guest = pairing.guest
		pair = pairing.pair
		other_pairing = Pairing.new(guest: pair,
																pair: guest)
		pairing.save && other_pairing.save
		
		
	end

	def destroy

	end

	private
	def pairing_params
		params.require(:guest_list).permit(:guest, :pair)
	end
end