source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.2.1"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.11"

# API stuff
gem "active_model_serializers", "~> 0.8.3" # Use active model serializers to serialize JSON. Use version 0.8 because it supports caching 
gem "kaminari" # Pagination
gem "grape", "~> 1.0.3" # DSL for APIs
gem "grape_logging" # Ensuring we get logs from Grape
gem "grape-swagger" # Swagger spec for Grape
gem "api-pagination" # Paginate the APIs
gem "rack-cors", require: "rack/cors" # Allow CORS access

# Redis, redis requirements
gem "hiredis" # Redis driver for MRI
gem "redis" # Redis itself
gem "readthis" # caching (using redis)
gem "sidekiq" # Background job processing (with redis)
gem "sinatra" # Used for sidekiq web
gem "sidekiq-failures" # Show sidekiq failures

# Users
gem "devise"
gem "omniauth" # sign on with other services
gem "omniauth-bike-index"
gem "devise-bootstrap-views" # Make better user views

# Frontend things
gem "sass-rails", "~> 5.0" # Use SCSS for stylesheets
gem "uglifier", ">= 1.3.0" # Use Uglifier as compressor for JavaScript assets
gem "webpacker" # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "turbolinks", "~> 5" # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "hamlit" # Faster haml templates
gem "bootstrap" # Internet Style
gem "jquery-rails" # We need jquery because bootstrap

gem "commonmarker" # Rendering markdown. Used to render readme on homepage

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :production do
  # Make logging - more useful and ingestible
  gem "lograge" # Structure log data, put it in single lines to improve the functionality
  gem "logstash-event" # Use logstash format for logging data
end

group :development, :test do
  gem "foreman" # Process runner for local work
  gem "rspec-rails" # Test framework
  gem "factory_bot_rails" # mocking/stubbing
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "guard", "~> 2.13.0", require: false
  gem "guard-rspec", "~> 4.6.4", require: false
  gem "guard-rubocop", require: false
  gem "rails-controller-testing" # Assert testing views
end

# Performance Stuff
gem "fast_blank" # high performance replacement String#blank? a method that is called quite frequently in ActiveRecord
gem "flamegraph", require: false
gem "rack-mini-profiler", require: false # If you can't see it you can't make it better
