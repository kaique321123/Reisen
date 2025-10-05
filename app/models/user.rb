class User < ApplicationRecord
  # Validações para o campo username
  validates :username, presence: true, uniqueness: true

  # ...outras validações ou métodos existentes...
end