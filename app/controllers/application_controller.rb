class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      redirect_to "/signin"
      flash[:alert] = "You are not logged in."
    end
  end

  def user_admin
    if !current_user
      redirect_to "/signin"
      flash[:alert] = "You are not logged in."
    elsif current_user.admin == false
      redirect_back(fallback_location: root_path)
      flash[:alert] = "You need to be an admin to perform that action."
    end
  end
end
