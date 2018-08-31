class Api::ReadingSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :words
end
