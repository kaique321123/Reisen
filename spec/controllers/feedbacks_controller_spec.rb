require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a feedback" do
      expect {
        post :create, params: { feedback: { author: "Teste", rating: 5, comment: "Comentário" } }
      }.to change(Feedback, :count).by(1)
    end
  end
end
