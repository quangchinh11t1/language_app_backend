class V1::LessonsController < ApplicationController
  before_action :authenticate_request!, except: [:get_lessons, :index, :show]

  def get_lessons
    @lessons = Lesson.all
    @lessons = ActiveModelSerializers::SerializableResource.new(@lessons)
    render json: {lessons: @lessons}
  end

  def index
    @lessons = Lesson.where(course_id: params[:course_id])
    @lessons = ActiveModelSerializers::SerializableResource.new(@lessons)
    render json: {lessons: @lessons}
  end

  def show
    @lesson = Lesson.find_by(id: params[:id])
    @lesson = ActiveModelSerializers::SerializableResource.new(@lesson)
    render json: {lesson: @lesson}
  end

  def create
    @lesson = Lesson.new lesson_params
    @lesson.course_id = params[:course_id]
    if @lesson.save
      render json: format_response("Request Ok", ActiveModelSerializers::SerializableResource.new(@lesson))
    else
      render json: format_response_error(@lesson.errors.messages)
    end
  end

  def update
    @lesson = Lesson.find_by(id: params[:id])
    if @lesson.update lesson_params
      render json: {
        status: true,
        data: ActiveModelSerializers::SerializableResource.new(@lesson)
      },
      status: :created
    else
      render json: {
        status: false,
        error: @lesson.errors
      },
      status: :unprocessable_entity
    end
  end

  def destroy
    @lesson = Lesson.find_by(id: params[:id])
    if @lesson.destroy
      render json: {
        status: true,
        data: @lesson
      },
      status: :ok
    else
      render json: format.json{head :unprocessable_entity}
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit Lesson::LESSON_PARAMS
  end
end
