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

  end
  def search_results

    @courses = Course.all
    if params[:course][:course_number].to_s != ''
       @courses = @courses.where("course_number = ?",params[:course][:course_number])
    end
    if params[:course][:title].to_s != ''
       @courses = @courses.where("title = ?",params[:course][:title])
    end
    if params[:course][:description].to_s != ''
       @courses = @courses.where("description = ?",params[:course][:description])
    end
    if params[:course][:status].to_s != ''
       @courses = @courses.where("status = ?",params[:course][:status])
    end
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
