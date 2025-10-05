class User < ApplicationRecord
  # Validações para o campo username
  validates :username, presence: true, uniqueness: true

  # ...outras validações ou métodos existentes...
  # Avatar via Active Storage
  has_one_attached :avatar

  # Validações simples para o avatar: tipo e tamanho
  validate :acceptable_avatar

  private

  def acceptable_avatar
    return unless avatar.attached?

    if avatar.blob.byte_size > 5.megabytes
      errors.add(:avatar, 'é muito grande. Tamanho máximo: 5MB')
    end

    acceptable_types = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif', 'image/x-icon', 'image/vnd.microsoft.icon', 'image/ico']
    unless acceptable_types.include?(avatar.blob.content_type)
      errors.add(:avatar, 'deve ser um arquivo de imagem (png, jpg ou gif)')
    end
  end
end