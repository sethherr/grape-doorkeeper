require 'spec_helper'

describe 'Me API V1', type: :request do
  include_context :doorkeeper_app_with_token
  describe 'current' do
    it 'Sends correct error code when no user present' do
      get '/api/v1/me'
      expect(response.response_code).to eq(401)
      expect(response.body.match('OAuth')).to be_present
      expect(response.headers['Content-Type'].match('json')).to be_present
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end

    it 'fails if no access token' do
      get '/api/v1/me', headers: { format: :json }
      expect(response.response_code).to eq(401)
      expect(JSON(response.body)['error'].present?).to be_truthy
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end

    it 'responds with the user' do
      get '/api/v1/me', params: { access_token: access_token.token }, headers: { format: :json }
      result = JSON.parse(response.body)
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(result['user']['name']).to eq(user.name)
      expect(result['user']['email']).to eq(user.email)
      expect(response.response_code).to eq(200)
    end
  end

  describe 'items' do
    it 'gets items, returning correct pagination serialized by the serializer' do
      FactoryGirl.create(:user)
      get '/api/v1/me/items', headers: { format: :json }
      result = JSON.parse(response.body)
      expect(result.first.keys.include?('secret')).to be_present
      expect(response.code).to eq('200')
      expect(response.header['Total']).to eq('20')
      expect(response.header['Link'].match('page=2>; rel=\"next\"')).to be_present
    end
  end

  describe 'update current user' do
    let(:attribs) { { email: 'foo@bar.com', name: 'new namething', access_token: access_token.token } }

    context 'incorrectly scoped access token' do
      it "fails if the access token doesn't have the required scope" do
        access_token.update_attribute :scopes, 'read_user'
        orig_name = user.name
        put '/api/v1/me', params: attribs, headers: { format: :json }

        expect(response.response_code).to eq(403)

        expect(response.body.match(/OAuth error.* write to user/i)).to be_present
        user.reload
        expect(user.name).to eq(orig_name)
      end
    end
    context 'scoped access token' do
      before do
        access_token.update_attribute :scopes, 'write_user'
      end
      it 'updates the user' do
        put '/api/v1/me', params: attribs, headers: { format: :json }
        expect(response.response_code).to eq(200)
        user.reload
        expect(user.name).to eq('new namething')
        expect(user.email).to eq('foo@bar.com')
      end

      it "fails when one of the supplied values isn't in the params" do
        orig_name = user.name
        put '/api/v1/me', params: attribs.merge(demo_value: 'foo'), headers: { format: :json }

        expect(response.response_code).to eq(400)
        expect(response.body).to match('demo_value does not have a valid value')
        user.reload
        expect(user.name).to eq orig_name
      end
    end
  end
end
