module API
  module V1
    class Me < API::V1::RootV1
      include API::V1::Defaults
      resource :me, desc: 'Operations about the current user' do
        desc 'Get information about the current user' do
          detail 'Current user is the owner of the `access_token` you use in the request.'
        end
        oauth2 # This endpoint requires authentication
        get '/' do
          {
            id: current_user.id.to_s,
            user: {
              email: current_user.email,
              name: current_user.name
            }
          }
        end

        # This endpoint doesn't require authentication
        paginate per_page: 10 # This paginates, with a default of 10 per page
        get '/items', each_serializer: ItemSerializer do
          # create some imaginary items
          items = (0..19).map do |i|
            ImaginaryItem.new(name: "Foo #{i * 7}", id: i, secret: 'Bar')
          end
          # We use the item serializer to serialize these items!
          paginate items
        end

        desc 'Update user, Protected, only accessible with write user'
        params do
          optional :email, type: String, desc: 'User email'
          optional :name, type: String, desc: 'User name'
          # Demo of value list, displays as select in swagger-ui
          optional :demo_value, type: String, values: ['value 1', 'value 2', '3'], default: 'value 1', desc: 'Special value list'
        end
        oauth2 'write_user'
        put '/' do
          # By using declared params, we ensure we only use the whitelisted params
          # and ignore missing params (not setting their values to nil)
          declared_p = declared(params, include_missing: false)
          demo_value = declared_p.delete(:demo_value)

          current_user.update_attributes(declared_p)
          {
            id: current_user.id.to_s,
            user: {
              value: demo_value,
              email: current_user.email,
              name: current_user.name
            }
          }
        end
      end
    end
  end
end
