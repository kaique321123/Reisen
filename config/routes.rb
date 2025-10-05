Rails.application.routes.draw do
  get 'documento/show'
  get 'perfil/show'

  # Rotas de notícias
  get '/news', to: 'news#index', as: 'news_index'
  get '/news/:id', to: 'news#show', as: 'news_item'

  # Páginas principais
  root "home#index"

  # Recursos existentes
  resources :perfil
  resources :documento
  resources :feedbacks, only: [:new, :create, :index, :show]

  # 🔹 Nova funcionalidade: feedbacks
  resources :feedbacks, only: [:index]
end
