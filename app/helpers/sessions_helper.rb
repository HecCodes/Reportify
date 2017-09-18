module SessionsHelper

  def secure_route
    redirect '/login' unless current_user
  end

  def current_user
    if session[:id]
      User.find(session[:id])
    end
  end

  def signed_in?
    !!current_user
  end

  def log_in(user)
    session[:id] = user.id
  end

end
