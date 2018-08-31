require "rails_helper"

RSpec.describe "/documentation", type: :request do
  describe "index" do
    it "redirects" do
      get "/documentation"
      expect(response).to redirect_to(documentation_v1_path)
    end
  end

  describe "v1" do
    it "redirects" do
      get "/documentation/v1"
      expect(response.code).to eq "200"
      expect(response).to render_template("documentation/v1")
    end
  end
end
