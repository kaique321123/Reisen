class NewsController < ApplicationController
  before_action :load_news, only: [:index, :show]

  def index
    # A variável @news já é carregada por load_news
  end

  def show
    news_item = @news.find { |n| n[:id] == params[:id].to_i }

    if news_item
      render json: news_item
    else
      render plain: "Notícia não encontrada", status: :not_found
    end
  end

  private

  def load_news
    @news = [
      { id: 1, title: "Top 10 destinos da Europa em 2025", summary: "Descubra os lugares mais visitados e novas tendências.", content: "Texto completo da notícia 1..." },
      { id: 2, title: "Como economizar em viagens longas", summary: "Dicas práticas para economizar durante suas aventuras.", content: "Texto completo da notícia 2..." }
    ]
  end
end
