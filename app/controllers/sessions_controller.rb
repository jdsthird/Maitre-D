class SessionsController < ApplicationController

  def new
    if request.xhr?
      render partial: "shared/login_form", locals: {errors: @errors}
    else
      render 'new'
    end
  end


  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password]) && request.xhr?
      log_in user
      redirect_to events_path
    elsif user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to events_path
    elsif request.xhr?
      @errors = ["I'm sorry, but these credentials were declined. Please try again."]
      render partial: "shared/login_form", statusCode: 422, locals: {errors: @errors}
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
