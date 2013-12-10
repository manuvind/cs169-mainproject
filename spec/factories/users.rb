# This will guess the User class
FactoryGirl.define do
  factory :user do
    email "example@example.com"
    password "password"
    name "hank"
    #admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email "example@example.com"
    password "password"
    name "Chris"
    #admin      true
  end
end
