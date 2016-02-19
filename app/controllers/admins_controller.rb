class AdminsController < ApplicationController
  def index
    @admins = User.where("type = ?", 'admin')
  end

  def show
    @admin = User.find(params[:id])
  end

  def new
    @admin = User.new
  end

  def edit
    @admin = User.find(params[:id])
  end

  def create
    @admin = User.new(admin_params)
    @admin[:type] = 'admin'
    if @admin.save
      redirect_to @admin
    else
      render 'new'
    end
  end

  def update
    @admin = User.find(params[:id])
    if @admin.update(admin_params_update)
      redirect_to @admin
    else
      render 'edit'
    end
  end

  def destroy
    @admin = User.find(params[:id])

    @admin.destroy

    redirect_to admins_path
  end

  private

  def admin_params
    params.require(:admin).permit(:email,:name,:password)
  end

  def admin_params_update
    params.require(:admin).permit(:name,:password)
  end
end