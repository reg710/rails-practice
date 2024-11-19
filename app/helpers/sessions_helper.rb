module SessionsHelper

  # Logs in the given user.
  def log_in
    session[:user_id] = user.id
  end
end
