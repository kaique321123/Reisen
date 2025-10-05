Dado('que existe um aviso com o título {string} e o corpo {string} marcado como visível') do |titulo, corpo|
  Notice.create!(title: titulo, body: corpo, visible: true)
end
Então('devo ver um aviso com o título {string}') do |titulo|
  within('.notices-list') do
    expect(page).to have_text(titulo)
  end
end

Então('devo ver o texto {string}') do |texto|
  expect(page).to have_text(texto)
end
