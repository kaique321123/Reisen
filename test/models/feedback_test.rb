require "test_helper"

class FeedbackTest < ActiveSupport::TestCase
  test "valid feedback" do
    feedback = Feedback.new(author: "Teste", rating: 5, comment: "Comentário")
    assert feedback.valid?
  end

  test "invalid without author" do
    feedback = Feedback.new(rating: 5, comment: "Comentário")
    assert_not feedback.valid?
  end
end
