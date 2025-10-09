require 'rails_helper'

RSpec.describe "script/show.html.erb", type: :view do
  it 'exibe o botão para acessar plano de viagem' do
    mocked_airlines = {
      "Latam" => "/mock/latam",
      "Gol" => "/mock/gol",
      "Azul" => "/mock/azul"
    }
    assign(:airlines, mocked_airlines)
    render
    expect(rendered).to have_css('a[href]', count: 3)
  end
end