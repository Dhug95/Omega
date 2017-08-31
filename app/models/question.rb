class Question < ApplicationRecord
  belongs_to :user
  belongs_to :property

  has_many :answers, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :body, presence: true, length: {minimum: 5}
end
