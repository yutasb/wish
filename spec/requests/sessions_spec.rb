require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "sessions" do
    it "sessions#new" do
      get sign_in_path
      expect(response).to have_http_status(200)
    end
  end
end
