class EventsController < ApplicationController

	def index
		@events = Event.all
	end

  def show
   @user = current_user
   @event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end

  end


  private
  def event_params
    params.require(:event).permit(:name, :zip_code, :state, :address_line_one, :address_line_two, :begins_at, :ends_at)
  end

end
