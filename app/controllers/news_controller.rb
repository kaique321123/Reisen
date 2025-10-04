class NewsController < ApplicationController
  def index
    # Cria uma notícia fixa para os testes do Cucumber
    @news = [
      { id: 1, title: "Últimas notícias de viagem", summary: "Resumo da notícia", content: "Conteúdo completo da notícia" }
    ]
  end

  def show
    # Encontra a notícia pelo id
    news_item = @news.find { |n| n[:id] == params[:id].to_i }
    if news_item
      @news_item = news_item
    else
      redirect_to news_index_path, alert: "Notícia não encontrada"
    end
  end
end
