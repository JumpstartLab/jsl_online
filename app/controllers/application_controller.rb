class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :authenticate_user

  before_action :courses

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    redirect_to root_path unless current_user
  end

  def courses
    @courses ||= Course.all.order("title")
  end
end