FactoryGirl.define do

  sequence :unique_name do |n|
    "some cool name#{n}"
  end

  sequence :unique_email do |n|
    "foo#{n}@bar.com"
  end

  factory :user do
    name  { generate(:unique_name) }
    email { generate(:unique_email) }
  end

end