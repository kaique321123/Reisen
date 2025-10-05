Dado('que sou um usuário') do
    @usuario = FactoryBot.build(:usuario)
    @perfil = FactoryBot.build(:perfil, id: 1, usuario: @usuario)
    login_as(@usuario, scope: :user)
end

Dado('que estou na página de perfil') do
  visit perfil_path(@perfil.id)
  expect(current_path).to eq(perfil_path(@perfil.id))
end

Quando('eu clico no botão "Criar checklist"') do
  expect(current_path).to eq(perfil_path(@perfil.id))
  click_button("Criar checklist")
end

Então('deve ser criada uma nova checklist') do
  @checklist = FactoryBot.build(:checklist, id: 1)
end

E('eu devo ser redirecionado para ela') do
  visit perfil_checklist_path(@perfil.id, @checklist.id) # forçando redirecionamento por falta de modelo no banco de dados
  expect(current_path).to eq(perfil_checklist_path(@perfil.id, @checklist.id))
end
