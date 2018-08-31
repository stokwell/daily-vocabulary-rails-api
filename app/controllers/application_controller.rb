class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  before_action :set_locale

  def query
    result = Schema.execute(
      params[:query]
    )
    render json: result
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_oprions(options = {})
    { locale: I18n.locale }
  end

end
