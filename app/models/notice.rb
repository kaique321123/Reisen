class Notice < ApplicationRecord
  scope :visible, -> { where(visible: true) }

  validates :title, presence: true
end
