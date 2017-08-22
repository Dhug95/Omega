class Property < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :favouriters, class_name: "User", join_table: "favouriters_and_favourites"
  paginates_per 2
end
