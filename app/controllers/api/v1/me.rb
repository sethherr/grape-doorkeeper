module API
  module V1
    class Me < API::V1::Root
      include API::V1::Defaults

      resource :me, desc: "Operations about the current user" do
        
        desc "Current user's information in access token's scope<span class='accstr'>*</span>", {
          notes: <<-NOTE
            Current user is the owner of the `access_token` you use in the request.
          NOTE
        }
        oauth2
        get '/' do
          result = {
            id: current_user.id.to_s,
            user: {
              email: current_user.email,
              name: current_user.name
            }
          }
        end
      end

    end
  end
end