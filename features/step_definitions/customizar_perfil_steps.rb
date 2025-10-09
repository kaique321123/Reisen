Dado('que estou logado como {string}') do |username|
  pending
end

Dado('acesso a página de edição de perfil') do
  pending
end

Quando('altero meu nome de usuário para {string}') do |novo_nome|
  pending
end

Quando('salvo as alterações') do
  pending
end

Então('devo ver uma mensagem de sucesso') do
  pending
end

Então('meu nome de usuário deve ser exibido como {string}') do |nome|
  pending
end

Quando('apago meu nome de usuário') do
  pending
end

Então('devo ver uma mensagem de erro indicando que o nome de usuário não pode ser em branco') do
  pending
end

Dado('que já existe um usuário com nome {string}') do |nome|
  User.create!(username: nome, email: "#{nome}@teste.com")
end

Então('devo ver uma mensagem de erro indicando que o nome de usuário já está em uso') do
  expect(page).to have_content('Username has already been taken')
end