class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:alert] = @user.errors.full_messages.join(" ,")
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end
end
