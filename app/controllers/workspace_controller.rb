class WorkspaceController < ApplicationController
  before_action :set_cache_headers

  def index
    @words = Word.by_user(current_user).order(created_at: :desc).where(language: I18n.locale)
    @word = Word.new
  end

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end


end
