class SessionsController < ApplicationController

  def new
    if request.xhr?
    else
      render 'new'
    end
  end


  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to events_path
    else
      @errors = ["I'm sorry, but these credentials were declined. Please try again."]
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end
end
