class SessionsController < ApplicationController
  def new
    User.new

  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to users_show_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render new
    end
  end

  def destroy
    log_out
    redirect_to home_index_path
  end
end
