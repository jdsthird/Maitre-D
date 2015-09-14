class EventsController < ApplicationController

	def index
    @user = current_user
		@events = @user.events
    if request.xhr?
      render json: @events
    end
	end

  def show
    @user = current_user
    @event = @user.events.where(id: params[:id]).first

    update_current_event(@event)

    @tables = @event.tables
    @collections = @event.collections

    seat_guests(@tables, @collections)

    @num_of_tables = @event.tables.length
    @number_of_seats = @event.tables.first.number_of_seats

    if request.xhr?
      render json: {tables: @tables, guests: @tables.guests}
    end
  end

  def new
    @user = current_user
    @event = Event.new


  end

  def update
    @user = current_user
    @event = Event.find_by_id(params[:id])

    @event.attributes = event_params

    if @event.save
      redirect_to @event
    else
      @errors = @event.errors.full_messages
    end
  end

  def create
    @user = current_user
    @event = @user.events.create!(event_params)

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

  def destroy
    @user = current_user
    @event = @user.events.where(id: params[:id])[0]
    @event.destroy
    redirect_to events_path
  end


  private
  def event_params
    params.require(:event).permit(:name, :zip_code, :state, :address_line_one, :address_line_two, :begins_at, :ends_at)
  end

end
