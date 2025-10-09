Dado("que estou logado como {string}") do |nome_usuario|
  @usuario = Usuario.find_or_create_by!(nome: nome_usuario, email: "#{nome_usuario}@teste.com", senha: "123456")
  visit login_path
  fill_in "Email", with: @usuario.email
  fill_in "Senha", with: "123456"
  click_button "Login"
end

Quando("eu acesso a página de novo feedback") do
  visit new_feedback_path
end

Quando("preencho o título com {string}") do |titulo|
  fill_in "Titulo", with: titulo
end

Quando("preencho o conteúdo com {string}") do |conteudo|
  fill_in "Conteudo", with: conteudo
end

Quando("envio o feedback") do
  click_button "Enviar"
end

Quando("envio o feedback sem preencher os campos") do
  click_button "Enviar"
end

Então("devo ver a mensagem {string}") do |mensagem|
  expect(page).to have_content(mensagem)
end

Então("devo ver o título {string} listado na página de feedbacks") do |titulo|
  visit feedbacks_path
  expect(page).to have_content(titulo)
end

Então("devo ver mensagens de erro indicando que o título e o conteúdo não podem ficar em branco") do
  expect(page).to have_content("Titulo não pode ficar em branco")
  expect(page).to have_content("Conteudo não pode ficar em branco")
end
