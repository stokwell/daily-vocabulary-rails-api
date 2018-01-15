class Api::WordSerializer < ActiveModel::Serializer
  attributes :id, :original, :translation, :transcription, :to, :from, :article, :date_stringified, :date_for_route

  def date_stringified
    object.created_at.strftime('%d %B %Y')
  end

  def date_for_route
    object.created_at.strftime('%Y%m%d')
  end
end
