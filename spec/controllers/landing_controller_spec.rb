require 'spec_helper'

describe LandingController do

  describe 'view landing index' do
    before do
      get :index
    end
    it { should respond_with(:success) }
    it { should render_template(:index) }
  end  
end
