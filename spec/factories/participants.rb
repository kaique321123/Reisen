FactoryBot.define do
  factory :participant do
    permission { 1 }
    user { nil }
    script { nil }
  end
end
