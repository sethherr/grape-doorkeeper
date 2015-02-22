require 'spec_helper'

describe 'Me API V1' do
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
      response.headers['Access-Control-Allow-Origin'].should == '*'
      expect(result['user']['name']).to eq(@user.name)
      expect(result['user']['email']).to eq(@user.email)
      expect(response.response_code).to eq(200)
    end

    it "fails if no access token" do 
      get '/api/v1/me', :format => :json
      response.response_code.should eq(401)
      expect(JSON(response.body)["error"].present?).to be_true
      response.headers['Access-Control-Allow-Origin'].should eq('*')
      response.headers['Access-Control-Request-Method'].should eq('*')
    end
  end

end