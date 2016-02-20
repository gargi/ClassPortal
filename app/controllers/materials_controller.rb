class MaterialsController < ApplicationController
<<<<<<< HEAD
  def index 
    @materials = Material.where("course_id = ?",params[:c].to_i)
=======
  def index
    @materials = Material.where(:course_id => params[:course_id])
>>>>>>> ptrived
  end


  def new
    @material = Material.new
  end

<<<<<<< HEAD
  def create
=======
  def student_course_material

      @materials = Material.where(:course_id => params[:course_id])

  end
  def edit
    @material = Material.find(params[:id])
  end

  def create c
>>>>>>> ptrived
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
