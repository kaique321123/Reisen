require 'rails_helper'

RSpec.describe "perfis/show.html.erb", type: :view do
  it 'exibe o botão para acessar plano' do
    render
    expect(rendered).to include('Acessar plano')
  end

  it 'exibe o botão para criar checklist' do
    render
    expect(rendered).to include('Criar checklist')
  end
end