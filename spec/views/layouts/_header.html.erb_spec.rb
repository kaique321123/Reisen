require 'rails_helper'

RSpec.describe "layouts/_header", type: :view do
  before do 
    render
  end

  it 'exibe link para a página principal' do
    expect(rendered).to have_link("Reisen", href: root_path)
  end

  it 'exibe link para a página de Notícias' do
    expect(rendered).to have_link("Notícias", href: news_index_path)
  end

  it 'exibe link para a página de Perfil' do 
    expect(rendered).to have_link("Perfil", href: perfil_path(1))
  end
end
