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
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
end

end
