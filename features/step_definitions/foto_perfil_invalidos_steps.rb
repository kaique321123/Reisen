Quando('eu envio um arquivo não-imagem') do
  caminho = Rails.root.join('spec', 'fixtures', 'files', 'sample.txt')
  attach_file('user[avatar]', caminho, make_visible: true)
end

Quando('eu envio uma imagem grande simulada') do
  tmp = Tempfile.new(['big', '.bin'], Rails.root.join('tmp'))
  tmp.binmode
  tmp.write('0' * (6 * 1024 * 1024))
  tmp.rewind
  attach_file('user[avatar]', tmp.path, make_visible: true)
end

Então('devo ver uma mensagem de erro indicando que o arquivo deve ser uma imagem') do
  expect(page).to have_content('deve ser um arquivo de imagem')
end

Então('devo ver uma mensagem de erro indicando que o arquivo é muito grande') do
  expect(page).to have_content('é muito grande')
end
