Dado("que estou na página de notícias") do
  visit news_path
end

Entao("devo ver o título {string}") do |text|
  expect(page).to have_content(text)
end

Entao("devo ver pelo menos uma notícia exibida na tela") do
  expect(page).to have_css('.news-item', minimum: 1)
end

Quando("eu clico em {string} na primeira notícia") do |link_text|
  first('.news-item').click_link(link_text)
end

Entao("devo ver o conteúdo completo da notícia") do
  expect(page).to have_content(/Texto completo da notícia/)
end
