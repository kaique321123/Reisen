class NewsController < ApplicationController
  def index
    @news = [
      { id: 1, title: "Top 10 destinos da Europa em 2025", summary: "Descubra os lugares mais visitados e novas tendências.", content: "Texto completo da notícia 1..." },
      { id: 2, title: "Dicas para viajar barato pelo Brasil", summary: "Como economizar nas suas viagens sem abrir mão do conforto.", content: "Texto completo da notícia 2..." },
      { id: 3, title: "Novas regras de bagagem aérea em 2025", summary: "O que muda para os viajantes nas companhias aéreas.", content: "Texto completo da notícia 3..." }
    ]
  end

  def show
    all_news = [
      { id: 1, title: "Top 10 destinos da Europa em 2025", summary: "Descubra os lugares mais visitados e novas tendências.", content: "Texto completo da notícia 1..." },
      { id: 2, title: "Dicas para viajar barato pelo Brasil", summary: "Como economizar nas suas viagens sem abrir mão do conforto.", content: "Texto completo da notícia 2..." },
      { id: 3, title: "Novas regras de bagagem aérea em 2025", summary: "O que muda para os viajantes nas companhias aéreas.", content: "Texto completo da notícia 3..." }
    ]

    @news_item = all_news.find { |n| n[:id] == params[:id].to_i }

    if @news_item
      render :show
    else
      render plain: "Notícia não encontrada", status: :not_found
    end
  end
end
