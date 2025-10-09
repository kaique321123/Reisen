# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Limpando dados"
User.destroy_all
Script.destroy_all
Checklist.destroy_all

puts "Criando usuários, roteiros e checklists"
main_user = User.create!(
  name: "Usuário teste",
  email: "testuser@example.com",
  password: "123456",
  password_confirmation: "123456",
)

puts "Usuário criado: {name=Usuário teste, email=testuser@example.com, password=123456}"

5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )

  rand(2..5).times do
    Script.create!(
        title: "Viagem para " + Faker::Address::city,
        user: user
      )
  end

  rand(1..3).times do
    Checklist.create!(
      title: Faker::Lorem.sentence,
      user: user
    )
  end
end

puts "Seed finalizado! Criados #{User.count} usuários, #{Script.count} roteiros e #{Checklist.count} checklists"