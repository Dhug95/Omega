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
<<<<<<< HEAD
=======
<<<<<<< HEAD
  :avatar_file_name => "app/assets/images/default_user.jpg",
  :admin => "true"
=======
>>>>>>> 47b683a9671af501e6e1eee9e9c5909e933468e6
  :admin => "true",
  :avatar_file_name => "IMG_20170804_113127.jpg",
  :avatar_content_type => "image/jpeg",
  :avatar_file_size => 731910,
  :avatar_updated_at => "2017-08-31 14:50:51"
<<<<<<< HEAD
=======
>>>>>>> 875b84bab5580f9f4ec34730734c1a283299344f
>>>>>>> 47b683a9671af501e6e1eee9e9c5909e933468e6
)

#user.skip_confirmation!
user.save!
