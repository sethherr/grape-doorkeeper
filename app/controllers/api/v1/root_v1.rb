module API
  module V1
    class RootV1 < API::Base
      format :json
      version "v1", using: :path

      add_swagger_documentation \
        host: "https://grape-doorkeeper.com",
        doc_version: "v1"
        hide_documentation_path: true,
        info: {
          title: "Grape Doorkeeper base app",
          description: "This is the base api provided by the awesome sample app - https://github.com/sethherr/grape-doorkeeper"
        }

      route :any, '*path' do
        error!({ error: 'Unable to find endpoint' }, 404)
      end
    end
  end
end
