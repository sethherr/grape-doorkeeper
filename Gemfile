ruby '2.4.1'
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Use postgresql as the database for Active Record
gem 'pg'
gem 'sass'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Basic running
gem 'haml'
gem 'puma'
gem 'bootstrap-sass'
gem 'devise'
gem 'omniauth'
gem 'omniauth-bike-index'
gem 'devise-bootstrap-views'
gem 'hashie-forbidden_attributes'

# Rendering Markdown
gem 'kramdown'

# Store configuration options
gem 'dotenv-rails'

# Authentication
gem 'doorkeeper'
gem 'wine_bouncer'

# Things tied in with Grade and swagger
gem 'kaminari'
gem 'grape'
gem 'grape_logging'
gem 'active_model_serializers', '~> 0.8.3' # Because nothing past this has caching
gem 'grape-swagger'
gem 'api-pagination'
gem 'rack-cors', require: 'rack/cors'

# Temporarily remote branch because updates, for more info look at
# https://github.com/d4be4st/swagger-ui_rails/pull/13
gem 'swagger-ui_rails', git: 'https://github.com/audionerd/swagger-ui_rails'

group :development, :test do
  gem 'foreman'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'rspec'
  gem 'factory_girl_rails'
  gem 'guard'
  gem 'guard-rubocop'
  gem 'guard-rspec'
end
