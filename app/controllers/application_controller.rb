class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Knock::Authenticable
  #before_action :authenticate_user

  def query
    result = Schema.execute(
      params[:query]
    )
    render json: result
  end

end
