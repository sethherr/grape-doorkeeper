require 'spec_helper'

describe 'Swagger API V1 docs', type: :request do
  describe 'all the paths' do
    it "responds with swagger for all the apis" do
      get '/api/v1/swagger_doc'
      result = JSON(response.body)
      expect(response.code).to eq('200')
      result['apis'].each do |api|
        # Not the fastest, but it ensures that all the swagger specs exist and render.
        get "/api/v1/swagger_doc#{api['path']}"
        expect(response.code).to eq('200')
      end
    end
  end
end