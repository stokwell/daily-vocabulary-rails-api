class Word < ApplicationRecord
  belongs_to :user
  belongs_to :reading
  validates_presence_of :original, :translation

  scope :by_user, ->(user) { where(user: user) }
end
