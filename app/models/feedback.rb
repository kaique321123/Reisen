class Feedback < ApplicationRecord
  validates :author, :comment, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
