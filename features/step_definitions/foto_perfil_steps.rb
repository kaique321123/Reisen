Quando('eu envio uma imagem de perfil') do
  caminho = Rails.root.join('spec', 'fixtures', 'files', 'sample.png')
  attach_file('user[avatar]', caminho, make_visible: true)
end

Então('devo ver a pré-visualização da minha foto de perfil na página') do
  expect(page).to have_css('img[alt="Avatar"]')
end

