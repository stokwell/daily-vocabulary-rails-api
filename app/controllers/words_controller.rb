class WordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @word = Word.new
    @word.examples.build
    @words = Word.by_user(current_user).order(created_at: :desc).where(language: I18n.locale)
    gon.words = @words
  end


  def create
    @word = Word.create(word_params.merge(user_id: current_user.id, language: I18n.locale ))
    respond_to do |format|
      if @word.save
       format.js  
     end
    end
  end

  private

  def word_params
    params.require(:word).permit(
      :original, :translation, :transcription, :to, :from, :article, :reading_id, :language,
      examples_attributes: [:id, :body]
    )
  end
end
