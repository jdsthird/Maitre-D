class PairingsController < ApplicationController

	def index
		# this needs a filter so the twin pairs only appear once
		@pairings = current_event.pairings.includes(:guest, :pair)
		@guests = current_event.guests
	end

	def create
		Pairing.create(pairing_params)
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
		params.require(:guest_list).permit(:guest, :pair)
	end
end