require 'rails_helper'

RSpec.describe "Mypages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/mypages/index"
      expect(response).to have_http_status(:success)
    end
  end
end
