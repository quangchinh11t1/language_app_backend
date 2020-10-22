class V1::CoursesController < ApplicationController
  before_action :authenticate_request!, except: :get_all

  def get_all
    @courses = Course.all
    @courses = ActiveModelSerializers::SerializableResource.new(@courses)
    render json: {course: @courses}
  end

  def show
    @course = @current_user.courses.find_by(id: params[:id])
    @course = ActiveModelSerializers::SerializableResource.new(@course)
    render json: {course: @course}
  end

  def index
    @course = @current_user.courses.all
    @course = ActiveModelSerializers::SerializableResource.new(@course)
    render json: {course: @course}
  end

  def create
    @course = Course.new course_params
    @course.user_id = @current_user.id
    if @course.save
      render json: format_response("Request Ok", ActiveModelSerializers::SerializableResource.new(@course))
    else
      render json: format_response_error(@course.errors.messages)
    end
  end

  def destroy
    @course = @current_user.courses.find_by(id: params[:id])
    if @course.destroy
      render json: {
        status: true,
        data: @course
      },
      status: :ok
    else
      render json: format.json{head :unprocessable_entity}
    end
  end

  def update
    @course = current_user.courses.find_by(id: params[:id])
    if @course.update course_params
      render json: {
        status: true,
        data: @course
      },
      status: :created
    else
      render json: {
        status: false,
        error: @course.errors
      },
      status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit Course::COURSE_PARAMS
  end
end
