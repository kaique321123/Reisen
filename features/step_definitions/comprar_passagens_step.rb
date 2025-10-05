Dado('que estou na página do documento') do
  visit perfil_documento_path(@perfil.id, @documento.id)
  expect(current_path).to eq(perfil_documento_path(@perfil.id, @documento.id))
end

Dado('existem companhias áreas com links de compra disponíveis') do
  expect(page).to have_selector('a[href^="/mock"]', count: 3)
end

Quando('eu clico no link da companhia {string}') do |company_name|
  click_link(company_name)
end

Então('a nova aba da companhia {string} deve ser aberta e ter o URL validado') do |company_name|
  companies = {
    "Latam" => "/mock/latam",
    "Gol" => "/mock/gol",
    "Azul" => "/mock/azul"
  }
  expected_url = companies[company_name]
  new_window = windows.last
  switch_to_window(new_window)
  expect(page).to have_current_path(expected_url, wait: 1, ignore_query: true)
end

Quando('eu clico no link de uma delas') do
  link = find('a[href^="/mock"]', match: :first)
  @texto = link.text
  click_link(@texto)
end

E('eu clico no link de uma delas {string}') do |string|
  link = find('a[href^="/mock"]', match: :first)
  page.execute_script("arguments[0].href = '/mock/erro/';", link)
  link.click
  if windows.size > 1
    new_window = windows.last
    switch_to_window(new_window)
  end
end

Então('eu devo ver uma mensagem de erro') do
  expect(page).to have_content('Erro')
end

Então('a nova aba da companhia deve ser aberta e ter o URL validado') do
  companies = {
    "Latam" => "/mock/latam",
    "Gol" => "/mock/gol",
    "Azul" => "/mock/azul"
  }
  new_window = windows.last
  switch_to_window(new_window)
  expect(page).to satisfy do |p|
    companies.values.any? do |expected_url|
      p.has_current_path?(expected_url, wait: 1, ignore_query: true)
    end
  end

end