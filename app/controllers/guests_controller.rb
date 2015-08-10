class GuestsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    guest = Guest.create!(guest_params)
    event = guest.event
    redirect_to event
  end

  def edit
  end

  def destroy
  end

  private
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :event_id)
    end
end