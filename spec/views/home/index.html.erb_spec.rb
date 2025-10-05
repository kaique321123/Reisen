require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it 'exibe o título do projeto' do
    render
    expect(rendered).to include('Reisen')
  end

  it 'exibe o subtítulo' do
    render
    expect(rendered).to include('Planejador de Viagens Colaborativo')
  end

  it 'exibe mensagem de boas-vindas' do 
    render
    expect(rendered).to include('Bem-vindo')
  end
end
