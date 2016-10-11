require 'spec_helper'

describe DocumentationController do
  describe 'view documentation index' do
    before do
      get :index
    end
    it { should respond_with(:success) }
    it { should render_template(:index) }
  end
end