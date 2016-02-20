class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(email: session[:email])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params_update)
      redirect_to @user
    else
      render 'edit'
    end
  end
  def create
    @user = User.new(user_params)
    @user[:type] = "student"
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
  def user_params_update
    params.require(:admin).permit(:name,:password)
  end
end
