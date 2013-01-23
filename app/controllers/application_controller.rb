# encoding: utf-8  # for invalid multibyte char (US-ASCII)

class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!

  protect_from_forgery
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authorize
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to("/login")
    end
  end
end
