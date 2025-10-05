Quando('acesso a página inicial') do
  visit root_path
end

E('devo ver {string}') do |texto|
  expect(page).to have_content(texto)
end