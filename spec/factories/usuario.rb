require 'ostruct'

FactoryBot.define do
  factory :usuario, class: OpenStruct do
    sequence(:id) { |n| n}
    name {"John Smith"}
    email {"johnsmith@example.com"}
    short_id {"#123ABC"}
  end
end