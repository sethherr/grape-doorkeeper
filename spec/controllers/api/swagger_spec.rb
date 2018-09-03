require 'spec_helper'

describe 'Swagger API V1 docs', type: :request do
  describe 'all the paths' do
    it 'responds with swagger for all the apis' do
      get '/api/v1/swagger_doc'
      result = JSON(response.body)
      expect(response.code).to eq('200')
    end
  end
end
