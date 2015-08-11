class GuestsController < ApplicationController
  def index
    @event = current_event
    @guests = current_event.guests.order(:last_name)
    if request.xhr?
      render json: @guests
    end
  end

  def show
    if request.xhr?
      render json: Guest.find_by_id(params[:id])
    end
  end

  def new
  end

  def create
    guest = Guest.create!(guest_params)
    event = guest.event
    if request.xhr?
      render json: guest
    else
      redirect_to event
    end
  end

  def edit
  end

  def update
    if request.xhr?
      guest = Guest.find_by_id(params[:id])
      guest.attributes = guest_params
      guest.save
      render json: guest
    else
      redirect_to event
    end
  end

  def destroy
    if request.xhr?
      guest = Guest.find_by_id(params[:id])
      guest.destroy
      render nothing: true
    end
  end

  private
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :event_id)
    end
end