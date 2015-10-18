require 'spec_helper'

describe 'Me API V1', type: :request do
  describe 'current' do
    it "Sends correct error code when no user present" do
      get '/api/v1/me'
      expect(response.response_code).to eq(401)
      expect(response.body.match('OAuth')).to be_present
      expect(response.headers['Content-Type'].match('json')).to be_present
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end
    
    it "responds with the user" do
      create_doorkeeper_app(scopes: OAUTH_SCOPES_S)
      get '/api/v1/me', :format => :json, :access_token => @token.token
      result = JSON.parse(response.body)
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(result['user']['name']).to eq(@user.name)
      expect(result['user']['email']).to eq(@user.email)
      expect(response.response_code).to eq(200)
    end

    it "fails if no access token" do 
      get '/api/v1/me', :format => :json
      expect(response.response_code).to eq(401)
      expect(JSON(response.body)["error"].present?).to be_truthy
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Request-Method']).to eq('*')
    end
  end

end