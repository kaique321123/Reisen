require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe "GET #index" do
    it "retorna sucesso" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "retorna sucesso para id válido" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end

    it "retorna 404 para id inválido" do
      get :show, params: { id: 999 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
