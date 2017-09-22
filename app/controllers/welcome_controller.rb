class WelcomeController < ApplicationController
  include SessionsHelper

  def index
    secure_route
    if !params[:id].nil?
      @user = User.find_by(id:current_user.id)
    end
  end

end
