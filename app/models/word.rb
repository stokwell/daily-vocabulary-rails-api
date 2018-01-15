class Word < ApplicationRecord
  belongs_to :user
  validates_presence_of :original, :translation, :from, :to

  scope :by_user, ->(user) { where(user: user) }
end
