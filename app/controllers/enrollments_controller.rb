class EnrollmentsController < ApplicationController

# Admin looking at enrollments and enrolling/removing students directly
# Instructor removing student from course directly

  def index
    @enrollments = Enrollment.all
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
    @enrollment[:status] = 'yes'
    if @enrollement.save
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

<<<<<<< HEAD
  def request_enroll c
=======
  def request
>>>>>>> ptrived
    @enrollment = Enrollment.new
    @enrollment[:grade] = 'NA'
    @enrollment[:user_id] = params[:student_id]
    @enrollment[:course_id] = params[:course_id]
    @enrollment[:status] = 'requested'
    @enrollment.save
  end

  def drop
    @enrollment = Enrollment.where("course_id = ? and user_id = ?",params[:course_id], params[:student_id])
    @enrollment.destroy
    redirect_to courses/student_courses_path
  end

  def accept e
    e[:status] = 'yes'
  end

  def student_history u
    @enrollments = Enrollment.where("user_id = ?",u.id)
    redirect_to enrollments_path
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:user_id,:course_id)
  end

  def enrollment_params_update
    params.require(:enrollment).permit(:grade,:status)
  end 
end
