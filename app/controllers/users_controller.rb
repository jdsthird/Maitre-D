class UsersController < ApplicationController
  def show
    @user = current_user
    @events = @user.events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Maitre-DBC!"
      redirect_to users_path
    else
      @errors = "Your username/password combination is incorrect!"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
