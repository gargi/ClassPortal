class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @courses.each do |course|
      if Date.today > course.end_date
        @course = course
        @course.update(status: "inactive")
      end
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    
    if @course.save
    	redirect_to @course
    else
        render 'new'
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params_update)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @enrollments = Enrollment.where("course_id = ?",params[:id])
    @enrollments.destroy_all
    @materials = Material.where("course_id = ?",params[:id])
    @materials.destroy_all
    @course = Course.find(params[:id])
    
    @course.destroy
 
    redirect_to courses_path
  end

  def search
   @course = Course.new
  end

  def search_results
    @parameters = Course.new(course_params)
    @courses = Course.all
    if @parameters[:course_number].to_s != ''      
       @courses = @courses.where("course_number = ?",@parameters[:course_number].to_s)
    end
    if @parameters[:title].to_s != ''
       @courses = @courses.where("title = ?",@parameters[:title].to_s)
    end
    if @parameters[:description].to_s != ''
       @courses = @courses.where("description = ?",@parameters[:description].to_s)
    end
    if @parameters[:status].to_s != ''
       @courses = @courses.where("status = ?",@parameters[:status].to_s)
    end
    if @parameters[:user_id].to_s != ''
       @courses = @courses.where("user_id = ?",@parameters[:user_id].to_s)
    end
    
    @enroll = Enrollment.where("user_id = ?",current_user[:id])
    @enrolledCourses = Array.new
    @enroll.each do |enr|
    	@enrolledCourses.push(enr.course_id.to_i)
    end
  end

  def instructor_history 
    if current_user[:type].to_s == "instructor"
	@courses = Course.where("user_id = ?",current_user[:id])
    else
    	@courses = Course.where("user_id = ?",params[:u])
    end
  end

  private
  def course_params
    params.require(:course).permit(:course_number,:title,:description,:start_date,:end_date,:status,:user_id)
  end

  def course_params_update
    params.require(:course).permit(:title,:description,:start_date,:end_date,:status,:user_id)
  end

end
