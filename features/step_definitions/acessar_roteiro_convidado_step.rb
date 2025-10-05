Dado('que existe um documento compartilhado') do
  @perfil = FactoryBot.build(:perfil)
  @documento = FactoryBot.build(:documento, id: 1, perfil: @perfil)
end

Quando('eu acessar o link público do documento') do
  visit perfil_documento_path(@perfil.id, @documento.id)
end

Então('eu devo ver o conteúdo do documento') do
  expect(page).to have_content(@documento.title)
end