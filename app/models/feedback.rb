# app/models/feedback.rb
class Feedback < ApplicationRecord
  belongs_to :usuario

  validates :titulo, presence: true
  validates :conteudo, presence: true
end
