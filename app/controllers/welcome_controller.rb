class WelcomeController < ApplicationController
  include SessionsHelper

  def index
    secure_route
    @user = User.find_by(id:current_user.id)
  end

end
