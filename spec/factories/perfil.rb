require 'ostruct'

FactoryBot.define do
  factory :perfil, class: OpenStruct do
    sequence(:id) { |n| n}
    association :usuario, strategy: :build
  end
end