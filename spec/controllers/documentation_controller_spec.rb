require 'spec_helper'

describe DocumentationController do
  describe 'view documentation index' do
    before do
      get :index
    end
    it { should respond_with(:redirect) }
    it { should redirect_to(api_v1_documentation_index_path) }
  end

  describe 'view api_v1 documentation' do
    before do
      get :api_v1
    end
    it { should respond_with(:success) }
    it { should render_template(:api_v1) }
  end
end
