require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context "validações" do
    it "é válido com autor, nota e comentário" do
      feedback = Feedback.new(author: "Maria", rating: 5, comment: "Excelente!")
      expect(feedback).to be_valid
    end

    it "é inválido sem autor" do
      feedback = Feedback.new(rating: 5, comment: "Muito bom")
      expect(feedback).not_to be_valid
    end

    it "é inválido sem comentário" do
      feedback = Feedback.new(author: "João", rating: 5)
      expect(feedback).not_to be_valid
    end

    it "é inválido com nota fora de 1 a 5" do
      feedback = Feedback.new(author: "Ana", rating: 6, comment: "Ruim")
      expect(feedback).not_to be_valid
    end
  end
end
