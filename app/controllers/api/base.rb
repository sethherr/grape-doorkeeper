require 'grape_logging'

module API
  class Base < Grape::API
    use GrapeLogging::Middleware::RequestLogger, instrumentation_key: 'grape_key',
                                                 include: [GrapeLogging::Loggers::FilterParameters.new]
    mount API::V1::RootV1

    def self.respond_to_error(e)
      logger.error e unless Rails.env.test? # Breaks tests...
      eclass = e.class.to_s
      message = "OAuth error: #{e}" if eclass =~ /WineBouncer::Errors/
      opts = { error: message || e.message }
      opts[:trace] = e.backtrace[0, 10] unless Rails.env.production?
      Rack::Response.new(opts.to_json, status_code_for(e, eclass), {
                           'Content-Type' => 'application/json',
                           'Access-Control-Allow-Origin' => '*',
                           'Access-Control-Request-Method' => '*'
                         }).finish
    end

    def self.status_code_for(error, eclass)
      if eclass =~ /OAuthUnauthorizedError/
        401
      elsif eclass =~ /OAuthForbiddenError/
        403
      elsif (eclass =~ /RecordNotFound/) || (error.message =~ /unable to find/i)
        404
      else
        (error.respond_to? :status) && error.status || 500
      end
    end
  end
end
