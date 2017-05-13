class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :leagues_navbar

  helper_method :logged_in?
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def leagues_navbar
    @lige = League.all
  end


  def logged_in?
    !!current_user
  end
end
