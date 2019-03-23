class WorkspaceController < ApplicationController
  def index
    @words = Word.by_user(current_user).order(created_at: :desc).where(language: I18n.locale)
    @word = Word.new
  end

end
