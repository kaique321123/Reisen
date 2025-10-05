require 'ostruct'

FactoryBot.define do
  factory :participante, class: OpenStruct do
    transient do
      perfil { build(:perfil) }
      documento { build(:documento, perfil: perfil) }
    end

    initialize_with do
      OpenStruct.new(
        usuario: perfil.usuario,
        perfil: perfil,
        documento: documento
      )
    end
  end
end