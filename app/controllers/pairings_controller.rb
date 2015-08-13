class PairingsController < ApplicationController

	def index
		# this needs a filter so the twin pairs only appear once
		@pairings = current_event.pairings.includes(:guest, :pair)
		@pairings = Pairing.filter_symmetric_pairings(@pairings.to_a)
		@guests = current_event.guests.order("last_name")
	end

	def create
		Pairing.create(pairing_params)
		redirect_to pairings_path
	end


	def destroy
		p1 = Pairing.find_by_id(params[:id])
		p2 = p1.twin
		p1.destroy
		p2.destroy

		redirect_to pairings_path
	end

	private
	def pairing_params
		params.require(:pairing).permit(:guest_id, :pair_id)
	end
end