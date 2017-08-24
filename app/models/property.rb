class Property < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :favouriters, class_name: "User", join_table: "favouriters_and_favourites"
  paginates_per 2

  has_attached_file :img1, styles: { small: "200x200>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img1, content_type: /\Aimage\/.*\z/

  has_attached_file :img2, styles: { small: "200x200>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img2, content_type: /\Aimage\/.*\z/

  has_attached_file :img3, styles: { small: "200x200>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img3, content_type: /\Aimage\/.*\z/

  has_many :questions, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
