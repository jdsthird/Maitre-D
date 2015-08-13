class UsersController < ApplicationController
  def show
    @user = current_user
    @events = @user.events
    render "events/index"
  end

  def new
    @user = User.new
    if request.xhr?
      render partial: "shared/signup_form", locals: {errors: @errors}
    else
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)
    successful_creation = @user.save
    if successful_creation && request.xhr?
      log_in @user
      redirect_to users_path
    elsif successful_creation
      log_in @user
      redirect_to users_path
    elsif request.xhr?
      @errors = @user.errors.full_messages
      render partial: "shared/signup_form", statusCode: 422, locals: {errors: @errors}
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
