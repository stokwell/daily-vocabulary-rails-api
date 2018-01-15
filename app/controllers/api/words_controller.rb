class Api::WordsController < ApplicationController
  before_action :authenticate_user

  def index
    words = Word.by_user(current_user).order(created_at: :desc).group_by {|t| t.created_at.to_date}
    render json: words, each_serializer: Api::WordSerializer
  end

  def create
    word = Word.create(word_params.merge(user_id: current_user.id))
    render json: word, each_serializer: Api::WordSerializer
  end

  private

  def word_params
    params.require(:word).permit(:original, :translation, :transcription, :to, :from, :article)
  end
end
