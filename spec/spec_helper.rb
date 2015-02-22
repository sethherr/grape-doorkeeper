ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'devise'
# require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.include Devise::TestHelpers, type: :controller

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end


def create_doorkeeper
  @user = FactoryGirl.create(:user)
  @application = Doorkeeper::Application.create(name: "MyApp", redirect_uri: "https://app.com")
end

def create_doorkeeper_app(opts={})
  create_doorkeeper
  @token = Doorkeeper::AccessToken.create!(application_id: @application.id,
    resource_owner_id: @user.id, scopes: opts && opts[:scopes])
end