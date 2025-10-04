    require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe "GET #index" do
    it "retorna sucesso e define @news" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:news)).to be_an(Array)
      expect(assigns(:news).length).to be >= 1
    end
  end

  describe "GET #show" do
    it "retorna sucesso para id válido" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
      expect(assigns(:news_item)[:title]).to match(/Top 10 destinos/)
    end

    it "retorna 404 para id inválido" do
      get :show, params: { id: 9999 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
