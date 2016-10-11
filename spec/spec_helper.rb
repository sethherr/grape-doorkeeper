ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'devise'
require 'shoulda/matchers'
# require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.render_views # Actually render the views - because that's important sometimes
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  config.infer_spec_type_from_file_location!
end
