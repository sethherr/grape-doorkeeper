module API
  module V1
    class RootV1 < API::Base
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers
      # Use the JsonApi adapter
      ActiveModelSerializers.config.adapter = :json_api
      version 'v1'
      default_error_formatter :json
      content_type :json, 'application/json'
      use ::WineBouncer::OAuth2

      rescue_from :all do |e|
        API::Base.respond_to_error(e)
      end

      mount API::V1::Me

      add_swagger_documentation \
        base_path: '/api',
        api_version: 'v1',
        hide_format: true, # don't show .json
        hide_documentation_path: true,
        mount_path: '/swagger_doc',
        endpoint_auth_wrapper: WineBouncer::OAuth2,
        info: {
          title: 'Grape Swagger base app',
          description: 'This is the base api provided by the awesome sample app - https://github.com/sethherr/grape-doorkeeper'
        }

      route :any, '*path' do
        raise StandardError, 'Unable to find endpoint'
      end
    end
  end
end
