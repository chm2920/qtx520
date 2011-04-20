#encoding: utf-8
class UserController < ApplicationController
  
  def reg
    @user = User.new
  end
  
  def reg_rst
    if request.post?
      @user = User.new(params[:user])
      @user.email = params[:user][:email]
      @user.username = params[:user][:username]
      @user.current_login_ip = request.remote_ip
      @user.last_login_ip = request.remote_ip
      ActiveRecord::Base.transaction do
        begin
          @user.save!
          session[:user_id] = @user.id
          session[:username] = @user.username
        rescue Exception => e
          ActiveRecord::Rollback
          record_error(e)
          render :action => "reg"
        else
          render :action => "reg_rst"
        end
      end
    else
      redirect_to "/reg"
    end
  end
  
  def login
     flash[:notice] = nil
  end
  
  def login_rst
    @user = User.check_login(params[:user_id], params[:pwd])
    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_back
    else
      flash[:notice] = '邮箱地址 或 密码错误.'
      render :action => "login"
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to "/"
  end
  
end
