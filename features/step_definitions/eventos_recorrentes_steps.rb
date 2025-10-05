require 'ostruct'

Quando('eu crio um evento chamado {string} com recorrência {string}') do |nome_evento, tipo_recorrencia|
  recorrencias_validas = ['diária', 'semanal', 'mensal']

  if nome_evento.nil? || nome_evento.strip.empty?
    @erro = "O nome do evento não pode estar em branco"
  elsif !recorrencias_validas.include?(tipo_recorrencia)
    @erro = "Tipo de recorrência inválido"
  else
    evento = OpenStruct.new(nome: nome_evento, recorrencia: tipo_recorrencia)
    @calendario.eventos << evento
  end
end

Quando('eu tento criar um evento sem nome com recorrência {string}') do |tipo_recorrencia|
  step %(eu crio um evento chamado "" com recorrência "#{tipo_recorrencia}")
end

Então('devo ver o evento {string} aparecendo toda semana no calendário') do |nome_evento|
  evento = @calendario.eventos.find { |e| e.nome == nome_evento && e.recorrencia == 'semanal' }
  expect(evento).not_to be_nil
end

Então('devo ver o evento {string} aparecendo todos os dias no calendário') do |nome_evento|
  evento = @calendario.eventos.find { |e| e.nome == nome_evento && e.recorrencia == 'diária' }
  expect(evento).not_to be_nil
end