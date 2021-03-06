# encoding: utf-8  # for invalid multibyte char (US-ASCII)

module ExtendModel
  # 扩展时间格式
  def def_each_datetime_with_format(*method_names)
    method_names.each do |method_name|
      define_method(method_name.to_s + "_with_format") do
        (self.send(method_name.to_s))? (self.send(method_name.to_s).strftime("%Y-%m-%d")):"2013-3-1"
      end
    end
  end

end

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
