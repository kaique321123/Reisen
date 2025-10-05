require 'ostruct'
require 'date'

Quando('eu crio um evento chamado {string} com data de início {string} e data de término {string}') do |nome_evento, data_inicio, data_fim|
  if nome_evento.strip.empty?
    @erro = "O nome do evento não pode estar em branco"
  elsif Date.parse(data_fim) < Date.parse(data_inicio)
    @erro = "A data de término não pode ser anterior à data de início"
  else
    evento = OpenStruct.new(
      nome: nome_evento,
      data_inicio: Date.parse(data_inicio),
      data_fim: Date.parse(data_fim)
    )
    @calendario.eventos << evento
  end
end

Quando('eu tento criar um evento chamado {string} com data de início {string} e data de término {string}') do |nome_evento, data_inicio, data_fim|
  step %(eu crio um evento chamado "#{nome_evento}" com data de início "#{data_inicio}" e data de término "#{data_fim}")
end

Quando('eu tento criar um evento sem nome com data de início {string} e data de término {string}') do |data_inicio, data_fim|
  step %(eu crio um evento chamado "" com data de início "#{data_inicio}" e data de término "#{data_fim}")
end

Então('devo ver o evento {string} durando de {string} até {string} no calendário') do |nome_evento, data_inicio, data_fim|
  evento = @calendario.eventos.find do |e|
    e.nome == nome_evento &&
    e.data_inicio == Date.parse(data_inicio) &&
    e.data_fim == Date.parse(data_fim)
  end
  expect(evento).not_to be_nil
end
