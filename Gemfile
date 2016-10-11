ruby '2.2.5'
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7'
# Use postgresql as the database for Active Record
gem 'pg'
gem 'sass'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 2.7.2'
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.0.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Basic running
gem 'haml'
gem 'puma'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'devise'
gem 'omniauth'
gem 'omniauth-bike-index'
gem 'devise-bootstrap-views'
gem 'hashie-forbidden_attributes'

# Store configuration options
gem 'dotenv-rails'


# Authentication
gem 'doorkeeper',   '~> 2.2.2'
gem 'wine_bouncer'

# Things tied in with Grade and swagger
gem 'kramdown'
gem 'kaminari'
gem 'grape'
gem 'active_model_serializers'
gem 'grape-active_model_serializers'
gem 'grape-swagger'
gem 'api-pagination'
gem 'rack-cors', require: 'rack/cors'

# There are issues surrounding rails-assets - see https://github.com/tenex/rails-assets/issues/291 
# (TL;DR - it changed hands but will be maintained, nobody has better alternatives)
# rails-assets is still the least complicated to get assets to "just work"
gem 'bundler', '>= 1.8.4' # required for rails-assets.org - JS and CSS assets
source 'https://rails-assets.org' do # JS land is crazy, so lock everything
  gem 'rails-assets-swagger-ui', '~> 2.2.5' # The js and css assets for swaggering
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'foreman'
  gem 'rerun'
  gem 'vcr'
  gem 'rspec', '~>3.3.0'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'guard'
  gem 'guard-rubocop'
  gem 'guard-rspec', '4.2.8'
  gem 'guard-livereload'
end

group :development do 
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do 
  gem 'database_cleaner'
end