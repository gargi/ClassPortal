class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(email: session[:email])
  end

  def login

  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to home_index_path, notice: 'User successfully created!'
    else
      flash[:danger] = 'Incorrect input. Retry again!'
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :type)
  end
end