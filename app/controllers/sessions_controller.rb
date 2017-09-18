class SessionsController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email:params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_path
    else
      @errors = ["Invalid Username/Email"]
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end