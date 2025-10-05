Dado('que estou logado como {string}') do |username|
  # Aqui você pode criar/logar o usuário, ou apenas garantir que existe
  @user = User.find_by(username: username) || User.create!(username: username, email: "#{username}@teste.com")
end

Dado('acesso a página de edição de perfil') do
  visit edit_profile_path
end

Quando('altero meu nome de usuário para {string}') do |novo_nome|
  fill_in 'Nome de usuário', with: novo_nome
end

Quando('salvo as alterações') do
  click_button 'Salvar'
end

Então('devo ver uma mensagem de sucesso') do
  expect(page).to have_content('Perfil atualizado com sucesso')
end

Então('meu nome de usuário deve ser exibido como {string}') do |nome|
  expect(find_field('Nome de usuário').value).to eq(nome)
end

Quando('apago meu nome de usuário') do
  fill_in 'Nome de usuário', with: ''
end

Então('devo ver uma mensagem de erro indicando que o nome de usuário não pode ser em branco') do
  expect(page).to have_content("Username can't be blank")
end

Dado('que já existe um usuário com nome {string}') do |nome|
  User.create!(username: nome, email: "#{nome}@teste.com")
end

Então('devo ver uma mensagem de erro indicando que o nome de usuário já está em uso') do
  expect(page).to have_content('Username has already been taken')
end