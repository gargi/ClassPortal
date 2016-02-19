class MaterialsController < ApplicationController
  def index(Course c)
    @materials = Material.where("course = ?",c)
  end

  def new
    @material = Material.new
  end

  def edit
    @material = Material.find(params[:id])
  end

  def create(Course c)
    @material = Material.new(material_params)
    @material[:course] = c
    if @material.save
      redirect_to @material
    else
      render 'new'
    end
  end

  def destroy(Course c)
    @material = Material.find(params[:id])

    @material.destroy

    redirect_to 'index c'
  end

  private

  def material_params
    params.require(:material).permit(:content)
  end
end