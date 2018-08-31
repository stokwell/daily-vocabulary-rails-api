class ReadingsController < ApplicationController
  def index
    @readings = Reading.by_user(current_user).order(created_at: :desc)
  end

  def show
    reading = Reading.find_by(id: params[:id])
    #render json: reading, each_serializer: Api::ReadingSerializer
  end

  def create
    reading = Reading.create(reading_params.merge(user_id: current_user.id))
    render json: reading, each_serializer: Api::ReadingSerializer
  end

  def reading_params
    params.require(:reading).permit(:title)
  end
end
