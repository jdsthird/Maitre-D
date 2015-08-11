class EventsController < ApplicationController

	def index
		@events = Event.all
    if request.xhr?
      render json: @events
    end
	end

  def show
    @user = current_user
    @event = @user.events.where(id: params[:id])[0]

    update_current_event(@event)
    @guests = @event.guests
    @num_of_tables = @event.tables.length
    @number_of_seats = @event.tables[0].number_of_seats
    @tables = seat_guests(@event.tables, @guests)

    if request.xhr?
      render json: {tables: @tables, guests: @tables.guests}
    end
  end

  def new
  	@event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.new(event_params)

    @event.set_tables(params[:event][:table])

    good = @event.save

    if good && request.xhr?
      render json: @event
    elsif good
      redirect_to @event
    elsif request.xhr?
      render json: @event.errors.full_messages
    else
      @errors = @event.errors.full_messages
      render :new
    end

  end


  private
  def event_params
    params.require(:event).permit(:name, :zip_code, :state, :address_line_one, :address_line_two, :begins_at, :ends_at)
  end

end
