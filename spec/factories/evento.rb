require 'ostruct'

FactoryBot.define do
  factory :evento, class: OpenStruct do
    nome { "Evento de Exemplo" }
    recorrencia { "semanal" }
  end
end
