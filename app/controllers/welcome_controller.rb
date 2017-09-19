class WelcomeController < ApplicationController
  include SessionsHelper

  def index
    secure_route
  end

end
