class Api::WordSerializer < ActiveModel::Serializer
  attributes :id, :original, :translation, :transcription, :to, :from, :article, :reading_id

end
