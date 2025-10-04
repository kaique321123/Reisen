Dado("que estou na página de notícias") do
  visit news_index_path
end

Quando("devo ver o título {string}") do |titulo|
  expect(page).to have_text(titulo)
end

Quando("eu clico em {string} na primeira notícia") do |link_text|
  within first(".news-item") do
    click_link link_text
  end
end

Então("devo ver o conteúdo completo da notícia") do
  expect(page).to have_text("Conteúdo completo da notícia")
end

Então("devo ver pelo menos uma notícia exibida na tela") do
  expect(page).to have_css(".news-item", minimum: 1)
end
