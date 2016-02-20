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
    @course = Course.find(params[:id])
    
    @course.destroy
 
    redirect_to courses_path
  end

  def search
    @parameters = Course.new(course_params)
    @courses = Course.all
    if @parameters[:course_number].to_s != ''
       @courses = @courses.where("course_number = ?",@parameters[:course_number])
    end
    if @parameters[:title].to_s != ''
       @courses = @courses.where("title = ?",@parameters[:title])
    end
    if @parameters[:description].to_s != ''
       @courses = @courses.where("description = ?",@parameters[:description])
    end
    if @parameters[:start_date].to_s != ''
       @courses = @courses.where("start_date = ?",@parameters[:start_date])
    end
    if @parameters[:end_date].to_s != ''
       @courses = @courses.where("end_date = ?",@parameters[:end_date])
    end
    if @parameters[:status].to_s != ''
       @courses = @courses.where("status = ?",@parameters[:status])
    end

    redirect_to 'courses#search_results' 
  end

  def instructor_history u
    @courses = Courses.where("user_id = ?",u.id)
    redirect_to courses_path
  end

  private
  def course_params
    params.require(:course).permit(:course_number,:title,:description,:start_date,:end_date,:status,:user_id)
  end

  def course_params_update
    params.require(:course).permit(:title,:description,:start_date,:end_date,:status,:user_id)
  end

end
