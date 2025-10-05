require 'ostruct'

FactoryBot.define do
  factory :documento, class: OpenStruct do
    sequence(:id) { |n| n}
    title {"Paris - França"}
    association :perfil, strategy: :build
  end
end