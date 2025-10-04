class NewsController < ApplicationController
  def index
    @news = [
      { id: 1, title: "Top 10 destinos da Europa em 2025", summary: "Descubra os lugares mais visitados e novas tendências.", content: "Texto completo da notícia 1..." },
      { id: 2, title: "Como economizar em passagens aéreas", summary: "Dicas práticas para comprar voos mais baratos.", content: "Texto completo da notícia 2..." }
    ]
  end

  def show
    all = {
      1 => { title: "Top 10 destinos da Europa em 2025", content: "Texto completo da notícia 1..." },
      2 => { title: "Como economizar em passagens aéreas", content: "Texto completo da notícia 2..." }
    }
    @news_item = all[params[:id].to_i]
    return render plain: "Notícia não encontrada", status: :not_found if @news_item.nil?
  end
end
