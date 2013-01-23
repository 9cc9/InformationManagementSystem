# encoding: utf-8
class SessionsController < ApplicationController
  layout "login"

  def new
  end

  # login page:登录验证
  def create
    if current_captcha_code == params[:captcha].upcase  # 验证码
      if user = User.authenticate(params[:name], params[:password])
        session[:user_id] = user.id
        redirect_to pending_review_projects_list_path
      end
    else
      redirect_to("/login")
    end
  end

  # logout：登出注销
  def destroy
    reset_session
    redirect_to("/login")
  end
end
