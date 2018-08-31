class Reading < ApplicationRecord
  belongs_to :user
  has_many :words

  scope :by_user, ->(user) { where(user: user) }
end
