Given('os seguintes feedbacks existem:') do |table|
  table.hashes.each do |feedback|
    Feedback.create!(feedback)
  end
end

When('eu visito a página de feedbacks') do
  visit '/feedbacks'
end

Then('eu devo ver {string}') do |conteudo|
  expect(page).to have_content(conteudo)
end
