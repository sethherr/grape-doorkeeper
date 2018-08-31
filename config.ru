# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require "rack/cors"

run Rails.application

use Rack::Cors do
  allow do
    origins "*"
    resource "/api/*", headers: :any, methods: :any
  end
end

