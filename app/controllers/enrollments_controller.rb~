class EnrollmentsController < ApplicationController

# Admin looking at enrollments and enrolling/removing students directly
# Instructor removing student from course directly

  def index
    if current_user[:type] == 'instructor'
    	@enrollments = Enrollment.joins(:course).where("enrollments.course_id = courses.id").where("courses.user_id = ?",current_user[:id]).where("courses.status = ?","active")
    else
    	@enrollments = Enrollment.joins(:course).where("courses.status = ?","active")
    end
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def new
    @enrollment = Enrollment.new
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment[:grade] = '-'
    @enrollment[:status] = 'enrolled'
    if @enrollment.save
      redirect_to @enrollment
    else
      render 'new'
    end
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    if @enrollment.update(enrollment_params_update)
      redirect_to @enrollment
    else
      render 'edit'
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])

    @enrollment.destroy

    redirect_to enrollments_path
  end

  #Student requests enrollment

  def view_courses
  end

  def request_enroll
    @enrollment = Enrollment.where("user_id = ?",current_user[:id]).where("course_id = ?",params[:course_id])
    if @enrollment.blank?
    	@enrollment = Enrollment.new
    	@enrollment[:user_id] = current_user[:id]
    	@enrollment[:course_id] = params[:course_id].to_s
    	@enrollment[:status] = 'requested'
        @enrollment[:grade] = '-'
    	@enrollment.save
        
    end    
    redirect_to url_for(:controller => :courses, :action => :search) 
  end

  def list_enrolled
    @enrollments = Enrollment.where("user_id = ?",current_user[:id]).where("enrollments.status = ?","enrolled").where("grade = ?","-")
  end

  def drop 
    @enrollment = Enrollment.find(params[:ed])
    @enrollment.update(status: "past")
    redirect_to url_for(:controller => :users, :action => :show)
  end

  def accept 
    @enrollment = Enrollment.find(params[:aid])
    @enrollment.update(status: "enrolled")
    redirect_to url_for(:controller => :enrollments, :action => :index)
  end

  def student_history 
    if current_user[:type].to_s == "student"
	@enrollments = Enrollment.where("user_id = ?",current_user[:id])
    else
    	@enrollments = Enrollment.where("user_id = ?",params[:u])
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:user_id,:course_id)
  end

  def enrollment_params_update
    params.require(:enrollment).permit(:grade,:status)
  end 
end
