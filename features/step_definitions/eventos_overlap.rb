Dado('que estou autenticado como planejador de viagem') do
  @planejador = FactoryBot.build(:participante, name: "Planejador", email: "planejador@example.com")
end

Dado('possuo um calendário de viagem') do
  @calendario = OpenStruct.new(eventos: [])
end

Então('devo ver a mensagem de erro no calendário {string}') do |mensagem_erro|
  expect(@erro).to eq(mensagem_erro)
end