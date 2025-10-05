require "test_helper"

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feedbacks_url
    assert_response :success
  end

  test "should create feedback" do
    assert_difference('Feedback.count') do
      post feedbacks_url, params: { feedback: { author: "Teste", rating: 5, comment: "Comentário" } }
    end
  end
end
