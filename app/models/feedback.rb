class Feedback < ApplicationRecord
  # Validações
  validates :author, presence: true
  validates :comment, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
end
