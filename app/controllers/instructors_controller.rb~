class InstructorsController < ApplicationController
  
  def edit_instructor
    @instructor = User.find(params[:id])
  end

  def update_instructor
    @instructor = User.find(params[:id])
    if @instructor.update(instructor_params_update)
      redirect_to @instructor
    else
      render 'edit_instructor'
    end
  end

  def index_course
    @courses = Course.all
  end

  def show_course
    @course = Course.find(params[:id])
  end

  def index_course
    @courses = Course.all
  end

  def show_course
    @course = Course.find(params[:id])
  end

  def new_course
    @course = Course.new
  end

  def edit_course
    @course = Course.find(params[:id])
  end

  def create_course
    @course = Course.new(course_params)
    
    if @course.save
    	redirect_to @course
    else
        render 'new_course'
    end
  end

  def update_course
    @course = Course.find(params[:id])
    if @course.update(course_params_update)
      redirect_to @course
    else
      render 'edit_course'
    end
  end

  def destroy_course
    @course = Course.find(params[:id])
    
    @course.destroy
 
    redirect_to courses_path
  end

 
  private
  def instructor_params_update
    params.require(:instructor).permit(:name,:password)
  end

  def course_params
    params.require(:course).permit(:cno,:title,:description,:instructor,:start,:end,:status)
  end

  def course_params_update
    params.require(:course).permit(:title,:description,:instructor,:start,:end,:status)
  end

end
