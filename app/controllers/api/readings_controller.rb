class Api::ReadingsController < ApplicationController
  before_action :authenticate_user

  def index
    readings = Reading.by_user(current_user).order(created_at: :desc)
    render json: readings, each_serializer: Api::ReadingSerializer
  end

  def show
    reading = Reading.find_by(id: params[:id])
    render json: reading, each_serializer: Api::ReadingSerializer
  end

  def create
    reading = Reading.create(reading_params.merge(user_id: current_user.id))
    render json: reading, each_serializer: Api::ReadingSerializer
  end

  def get_pdf
    reading = Reading.find_by(id: params[:id])
    respond_to do |format|
      format.pdf do
        pdf = ReadingPdf.new
        send_data pdf.render, type: "application/pdf", filename: "reading_#{reading.id}.pdf", disposition: "inline"
      end
    end
  end

  private

  def reading_params
    params.require(:reading).permit(:title)
  end
end
