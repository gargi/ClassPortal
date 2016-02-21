class MaterialsController < ApplicationController
  def index 
    @materials = Material.where("course_id = ?",params[:c].to_i)
    @val = params[:c].to_i
  end

  def new
    @material = Material.new
    @val = params[:c].to_i
  end

  def create
    @material = Material.new(material_params)
    @material[:course_id] = params[:c].to_i 
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
    if current_user[:type].to_s == "instructor"
      @courses = Course.where("user_id = ?",current_user[:id])
    else if current_user[:type].to_s == "student"
      @courses = Course.joins(:enrollments).where("courses.id = enrollments.course_id").where("enrollments.user_id = ?",current_user[:id])
    else
      @courses = Course.all
    end
   end
  end


  private

  def material_params
    params.require(:material).permit(:course_id,:content)
  end
end
