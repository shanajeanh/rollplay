class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def authenticate_user!
    if !logged_in?
      flash[:warning] = "You need to sign in before continuing."
      redirect_to root_path
    end
  end

  def current_user
    user = session[:user_id]
    if user > User.last.id
      user = nil
    end
    @current_user ||= User.find(user) if user
  end

  def logged_in?
    !current_user.nil?
  end
end
