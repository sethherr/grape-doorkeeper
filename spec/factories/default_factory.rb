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

  factory :doorkeeper_application, class: Doorkeeper::Application do
    name { generate(:unique_name) }
    redirect_uri 'https://app.com'
  end

  factory :doorkeeper_token, class: Doorkeeper::AccessToken do
    application_id { FactoryGirl.create(:doorkeeper_application).id }
    resource_owner_id { FactoryGirl.create(:user).id }
    scopes :public
  end
end
