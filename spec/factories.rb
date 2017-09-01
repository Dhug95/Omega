FactoryGirl.define do
  factory :user do
    username              "GianniBiondi"
    email                 "mario@live.it"
    password              "password"
    password_confirmation "password"
    admin                 "true"
  end
end
