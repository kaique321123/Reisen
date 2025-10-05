Dado('que estou na página do documento') do
  visit perfil_documento_path(@perfil.id, @documento.id)
  expect(current_path).to eq(perfil_documento_path(@perfil.id, @documento.id))
end

Dado('existem companhias áreas com links de compra disponíveis') do
  expect(page).to have_selector('a[href^="/mock"]', count: 3)
end

Quando('eu clico no link da companhia {string}') do |company_name|
  click_link(company_name)
  sleep 0.5
end

Então('a nova aba da companhia {string} deve ser aberta e ter o URL validado') do |company_name|
  companies = {
    "Latam" => "/mock/latam",
    "Gol" => "/mock/gol",
    "Azul" => "/mock/azul"
  }
  expected_url = companies[company_name]

  expect(page.windows.size).to be > 1, "Nova janela não foi aberta"

  within_window(page.windows.last) do
    expect(page).to have_current_path(expected_url, wait: 5, ignore_query: true)
  end

  page.windows.last.close
end

Quando('eu clico no link de uma delas') do
  link = find('a[href^="/mock"]', match: :first)
  @texto = link.text
  click_link(@texto)
  sleep 0.5
end

E('eu clico no link de uma delas {string}') do |string|
  link = find('a[href^="/mock"]', match: :first)

  page.execute_script("arguments[0].href = '/mock/erro/';", link)
  link.click
  sleep 0.5

  if page.windows.size > 1
    within_window(page.windows.last) do
      # Só preciso ser redirecionado para a página de erro
    end
  end
end

Então('eu devo ver uma mensagem de erro') do
  within_window(page.windows.last) do
    expect(page).to have_content('Erro', wait: 5)
  end
  page.windows.last.close if page.windows.size > 1
end

Então('a nova aba da companhia deve ser aberta e ter o URL validado') do
  companies = {
    "Latam" => "/mock/latam",
    "Gol" => "/mock/gol",
    "Azul" => "/mock/azul"
  }

  expect(page.windows.size).to be > 1, "Nova janela não foi aberta"

  within_window(page.windows.last) do
    url_valida = companies.values.any? do |expected_url|
      page.has_current_path?(expected_url, wait: 5, ignore_query: true)
    end

    expect(url_valida).to be_truthy, "URL não corresponde a nenhuma companhia esperada. URL atual: #{current_path}"
  end

  page.windows.last.close
end