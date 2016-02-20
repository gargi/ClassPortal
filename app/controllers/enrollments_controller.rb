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

  def request
    @enrollment = Enrollment.new
    @enrollment[:grade] = 'NA'
    @enrollment[:user_id] = current_user.id
    @enrollment[:course_id] = params[:c]
    @enrollment[:status] = 'no'
    @enrollment.save
  end

  def drop
    @enrollment = Enrollment.where("course_id = ? and user_id = ?",params[:course_id], params[:student_id])
    if @enrollment[:grade].to_s == ''
      @enrollment[:status] = 'no'
    end
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
    params.require(:enrollment).permit(:user,:course,:grade)
  end

  def enrollment_params_update
    params.require(:enrollment).permit(:grade,:status)
  end 
end
