class Word < ApplicationRecord
  belongs_to :user
  #belongs_to :reading
  validates_presence_of :original, :translation
  has_many :examples
  accepts_nested_attributes_for :examples, allow_destroy: true, reject_if: :all_blank

  scope :by_user, ->(user) { where(user: user) }
end
