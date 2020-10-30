class V1::WordsController < ApplicationController
  before_action :authenticate_request!, except: [:get_words, :index, :show]

  def get_words
    @words = Word.all
    @words = ActiveModelSerializers::SerializableResource.new(@words)
    render json: {words: @words}
  end

  def index
    @words = Word.where(lesson_id: params[:lesson_id])
    @words = ActiveModelSerializers::SerializableResource.new(@words)
    render json: {words: @words}
  end

  def show
    @word = Word.find_by(id: params[:id])
    @word = ActiveModelSerializers::SerializableResource.new(@word)
    render json: {word: @word}
  end

  def create
    @word = Word.new word_params
    @word.lesson_id = params[:lesson_id]
    if @word.save
      render json: format_response("Request Ok", ActiveModelSerializers::SerializableResource.new(@word))
    else
      render json: format_response_error(@word.errors.messages)
    end
  end

  def update
    @word = Word.find_by(id: params[:id])
    if @word.update word_params
      render json: {
        status: true,
        data: ActiveModelSerializers::SerializableResource.new(@word)
      },
      status: :created
    else
      render json: {
        status: false,
        error: @word.errors
      },
      status: :unprocessable_entity
    end
  end

  def destroy
    @word = Word.find_by(id: params[:id])
    if @word.destroy
      render json: {
        status: true,
        data: @word
      },
      status: :ok
    else
      render json: format.json{head :unprocessable_entity}
    end
  end

  private

  def word_params
    params.require(:word).permit Word::WORD_PARAMS
  end
end
