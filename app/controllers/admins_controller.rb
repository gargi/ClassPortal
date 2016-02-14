class AdminsController < ApplicationController
  def index_admin
    @admins = Admin.all
  end

  def show_admin
    @admin = Admin.find(params[:id])
  end

  def new_admin
    @admin = Admin.new
  end

  def edit_admin
    @admin = Admin.find(params[:id])
  end

  def create_admin
    @admin = Admin.new(admin_params)
    
    if @admin.save
    	redirect_to @admin
    else
        render 'new_admin'
    end
  end

  def update_admin
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params_update)
      redirect_to @admin
    else
      render 'edit_admin'
    end
  end

  def destroy_admin
    @admin = Admin.find(params[:id])
    
    @admin.destroy
 
    redirect_to admins_path
  end

  def index_instructor
    @instructors = Instructor.all
  end

  def show_instructor
    @instructor = Instructor.find(params[:id])
  end

  def new_instructor
    @instructor = Instructor.new
  end

  def create_instructor
    @instructor = Instructor.new(instructor_params)
    
    if @instructor.save
    	redirect_to @instructor
    else
        render 'new_instructor'
    end
  end
 
  def destroy_instructor
    @instructor = Instructor.find(params[:id])
    
    @instructor.destroy
 
    redirect_to instructors_path
  end

  def index_student
    @students = Student.all
  end

  def show_student
    @student = Student.find(params[:id])
  end

  def destroy_student
    @student = Student.find(params[:id])
    
    @student.destroy
 
    redirect_to students_path
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

  def course_params
    params.require(:course).permit(:cno,:title,:description,:instructor,:start,:end,:status)
  end

  def course_params_update
    params.require(:course).permit(:title,:description,:instructor,:start,:end,:status)
  end

  def instructor_params
    params.require(:instructor).permit(:email,:name,:password)
  end

  def instructor_params_update
    params.require(:instructor).permit(:name,:password)
  end

  def admin_params
    params.require(:admin).permit(:email,:name,:password)
  end

  def admin_params_update
    params.require(:admin).permit(:name,:password)
  end
end
