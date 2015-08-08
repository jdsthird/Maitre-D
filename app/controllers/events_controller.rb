class EventsController < ApplicationController
  def show
    @user = User.first
    @event = Event.find(params[:id])
  end
end
