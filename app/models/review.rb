class Review < ApplicationRecord
  belongs_to :property
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :valutation, presence: true
end
