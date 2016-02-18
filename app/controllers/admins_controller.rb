class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)
    
    if @admin.save
    	redirect_to @admin
    else
        render 'new'
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params_update)
      redirect_to @admin
    else
      render 'edit'
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    
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
