class UsersController < ApplicationController

  def new

  end

  def create
    #gotta find a way to make this work. Best we got was and this leads to the else end of the if condition
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome to Spiky Chat!"
      redirect_to root_path
    else
      flash.now[:error] = "Sorry, that username was taken"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
