class V1::Public::LecturesController < ApplicationController
  before_action :set_lecture, only: %i[ show update destroy ]

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)

    if @lecture.save
      render :show, status: :created, location: @lecture
    else
      render json: @lecture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    if @lecture.update(lecture_params)
      render :show, status: :ok, location: @lecture
    else
      render json: @lecture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecture_params
      params.require(:lecture).permit(:name, :description)
    end
end
