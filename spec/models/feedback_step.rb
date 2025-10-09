require 'rails_helper'

RSpec.describe Feedback, type: :model do
  let(:usuario) { Usuario.create!(nome: "Teste", email: "teste@teste.com", senha: "123456") }

  it "é válido com título, conteúdo e usuário" do
    feedback = Feedback.new(titulo: "Sugestão", conteudo: "Melhorar sistema", usuario: usuario)
    expect(feedback).to be_valid
  end

  it "é inválido sem título" do
    feedback = Feedback.new(conteudo: "Conteúdo", usuario: usuario)
    expect(feedback).not_to be_valid
  end

  it "é inválido sem conteúdo" do
    feedback = Feedback.new(titulo: "Título", usuario: usuario)
    expect(feedback).not_to be_valid
  end
end
