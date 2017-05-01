class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def authenticate_user!
  end
  
  def block_inactive_user!
  end
  
  def current_user
    User.first
  end
end
