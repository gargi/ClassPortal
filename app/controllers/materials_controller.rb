class MaterialsController < ApplicationController
  def index 
    @materials = Material.where("course_id = ?",params[:c].to_i)
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to @material
    else
      render 'new'
    end
  end

  def show
    @material = Material.find(params[:id])
  end

  def course_selection
    @courses = Course.all
  end

  private

  def material_params
    params.require(:material).permit(:course_id,:content)
  end
end
