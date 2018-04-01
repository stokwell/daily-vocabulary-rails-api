class WordsController < ApplicationController
  def index
    @word = Word.new
    @word.examples.build
    @words = Word.by_user(current_user).order(created_at: :desc)
    gon.watch.words = @words
  end

  def create
    word = Word.create(word_params.merge(user_id: current_user.id))
    if word.save
      render json: word, each_serializer: Api::WordSerializer
    end
  end

  private

  def word_params
    params.require(:word).permit(
      :original, :translation, :transcription, :to, :from, :article, :reading_id,
      examples_attributes: [:id, :body]
    )
  end
end
