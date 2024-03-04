class Api::V1::RegistrationsController < ApplicationController
  before_action :authenticate_api_v1_user!, :set_current_user
  before_action :set_registration, only: %i[show update destroy]

  # GET /registrations
  # GET /registrations.json
  def index
    user_registrations = @user.registrations.includes(:lecture)
    @first_term_registrations  = user_registrations.where(lectures: { term: :first_term })
    @second_term_registrations = user_registrations.where(lectures: { term: :second_term })
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show; end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)

    begin
      if @registration.save
        render :show, status: :created
      else
        render json: @registration.errors, status: :unprocessable_entity
      end
    # TODO: エラーハンドリングの共通化
    rescue ActiveRecord::RecordNotUnique
      render json: { errors: ['同じ講義が登録されています'] }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    if @registration.update!(registration_params)
      render :show, status: :ok
    else
      render json: @registration.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    render json: { errors: ['同じ講義が登録されています'] }, status: :unprocessable_entity
  rescue ActiveRecord::RecordInvalid => e
    error_message = e.message.split('Errors')[1]
    render json: { errors: [error_message] }, status: :unprocessable_entity
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    if @registration.destroy
      render json: { message: '削除しました' }, status: :ok
    else
      render json: { errors: 'データが存在しません' }, status: :not_found
    end
  end

  private

  def set_current_user
    @user = current_api_v1_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_registration
    @registration = Registration.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def registration_params
    params.require(:registration).permit(:lecture_id).merge(user_id: current_api_v1_user.id)
  end
end
