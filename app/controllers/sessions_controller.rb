class SessionsController < ApplicationController

  def new
      # debugger
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    #@user で良いのか確認！！！（課題）
    if @user && @user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
      # remember user
      # redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end