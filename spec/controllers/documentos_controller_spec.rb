require 'rails_helper'

RSpec.describe DocumentosController, type: :controller do
  describe 'GET #show' do
    it 'retorna status 200' do
      get :show, params: { perfil_id: 1, id: 1}
      expect(response).to have_http_status(:success)
    end

=begin
    Tem que implementar o modelo de Perfil e Documento antes!
    it 'retorna status 404' do
      get :show, params: { perfil_id: -1, id: -1}
      expect(response).to have_http_status(:not_found)
    end
=end

    it 'renderiza #show corretamente' do
      get :show, params: { perfil_id: 1, id: 1}
      expect(response).to render_template(:show)
    end

    it 'atribui @airlines corretamente' do
      get :show, params: { perfil_id: 1, id: 1}
      expect(assigns(:airlines)).not_to be_nil
    end
  end
end