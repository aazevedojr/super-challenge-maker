def current_user
  @current_user ||= User.find(session[:id]) if session[:id]
end

def logged_in?
  !!current_user
end

def log_in
  session[:id] = @user.id
end

def log_out
  session[:id] = nil
end
