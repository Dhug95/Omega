# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create!([{email: 'admin@omega.it'}, {encrypted_password: '1q2w3e4r5t6y7u8i9o0p'}, {password: 'SeCrEt'}, {password_confirmation: 'SeCrEt'}, {username: 'admin'}, {name: 'admin'}, {admin: 'true'}])
user = User.new(
  :email => "admin@omega.it",
  :password => "SeCrEt",
  :password_confirmation => "SeCrEt",
  :username => "admin",
  :admin => "true"
)
#user.skip_confirmation!
user.save!
