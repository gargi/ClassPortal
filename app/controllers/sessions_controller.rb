class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:email] == "" || params[:session][:password] == ""
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to login_path
    else
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        redirect_to users_show_path,notice: 'User logged in!'
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render login_path
      end
    end


  end

  def destroy
    log_out
    redirect_to home_index_path
  end
end
