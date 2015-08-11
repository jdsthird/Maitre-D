class UsersController < ApplicationController
  def show
    @user = current_user
    @events = @user.events
    render "events/index"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to users_path
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
