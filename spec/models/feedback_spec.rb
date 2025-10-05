require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it "is valid with valid attributes" do
    feedback = Feedback.new(author: "Teste", rating: 5, comment: "Comentário")
    expect(feedback).to be_valid
  end

  it "is invalid without author" do
    feedback = Feedback.new(rating: 5, comment: "Comentário")
    expect(feedback).not_to be_valid
  end
end
