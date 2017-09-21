class UsersController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && params[:user][:password] === params[:user][:password2]
      log_in @user
      redirect_to root_path
    elsif params[:user][:password] != params[:user][:password2]
      @errors = ["Passwords do not match"]
      render 'new'
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password)
  end
end
