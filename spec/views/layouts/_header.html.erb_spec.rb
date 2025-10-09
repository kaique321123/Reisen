require 'rails_helper'

RSpec.describe "layouts/_header", type: :view do
  before do 
    render
  end

  it 'exibe link para a página principal' do
    expect(rendered).to have_link("Reisen", href: root_path)
  end

  it 'exibe link para a página de Notícias' do
    # Não tem a implementação correta para notícias (talvez vale remover)
    expect(rendered).to have_link("Notícias", href: root_path)
  end

  it 'exibe link para a página de Perfil' do
    # Não tem a implementação correta para perfil (talvez vale remover)
    expect(rendered).to have_link("Perfil", href: root_path)
  end
end
