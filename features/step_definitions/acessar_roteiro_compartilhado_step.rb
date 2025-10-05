Dado('que sou um participante da viagem') do
    participante = FactoryBot.build(:participante)
    @usuario = participante.usuario
    @perfil = participante.perfil
    @documento = participante.documento
    login_as(@participante, scope: :user)
end

E('o documento compartilhado existe') do
  @documento = FactoryBot.create(:documento)
end

Quando('eu acessar o link do documento') do
  visit perfil_documento_path(@perfil.id, @documento.id)
end

Quando('eu visito a página de perfil') do
  visit perfil_path(@perfil.id)
end

Quando('eu clico no botão "Acessar plano"') do
  expect(current_path).to eq(perfil_path(@perfil.id))
  click_button("Acessar plano")
  visit perfil_documento_path(@perfil.id, @documento.id)
end

Então('eu devo ser redirecionado ao documento compartilhado') do
  expect(current_path).to eq(perfil_documento_path(@perfil.id, @documento.id))
  expect(page).to have_content('Paris - França')
end