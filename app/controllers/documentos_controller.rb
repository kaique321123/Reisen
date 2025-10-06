class DocumentosController < ApplicationController
  def show
    @airline = airlines
  end

  private
  def airlines
    {
      "Latam" => "https://www.latamairlines.com/br/pt",
      "Gol" => "https://www.voegol.com.br/",
      "Azul" => "https://www.voeazul.com.br/home/br/pt/home"
    }
  end
end
