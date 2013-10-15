FactoryGirl.define do
  factory :user do
    password 'password'
    sequence(:email) { |n| "email#{n}@address.com" }
  end

  factory :store do
    name 'store_name'
    user #created a user for the store
  end	

end
