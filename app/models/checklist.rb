class Checklist < ApplicationRecord
  belongs_to :user

  has_many :checklist_items, dependent: :destroy
end
