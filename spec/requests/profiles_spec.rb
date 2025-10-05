require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  describe "GET /profile/edit" do
    it "returns http success" do
      user = User.create!(username: "kaique", email: "kaique@teste.com")
      # Faça login aqui se necessário
      get "/profile/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /profile" do
    it "updates the profile and redirects" do
      user = User.create!(username: "kaique", email: "kaique@teste.com")
      # Faça login aqui se necessário
      patch "/profile", params: { user: { username: "novo_nome" } }
      expect(response).to have_http_status(:redirect) # ou :success, conforme seu controller
    end
  end
end