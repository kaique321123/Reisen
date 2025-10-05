require 'ostruct'

FactoryBot.define do
  # por enquanto o foco é só criar a lista, e não adicionar itens
  #factory :item , class: OpenStruct do
  #  sequence(:id) { |n| n}
  #  title {"Fazer check-in no hotel"}
  #  checked {false}
  #  created_at {"2025-10-04"}
  #end
  factory :checklist, class: OpenStruct do
    sequence(:id) { |n| n}
    title {"Viagem para França"}
    transient do
      items_count {0}
    end
  end
end