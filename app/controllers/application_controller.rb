class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    redirect_to "/signin" unless current_user
    # flash[:alert] = "You are not logged in."
  end
end

def user_admin
  redirect_to "/"
  flash[:alert] = "You need to be an admin to perform that action." unless current_user.admin
end
