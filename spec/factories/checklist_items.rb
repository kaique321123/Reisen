FactoryBot.define do
  factory :checklist_item do
    description { "MyText" }
    user { nil }
    checklist { nil }
  end
end
