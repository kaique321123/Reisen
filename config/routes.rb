Rails.application.routes.draw do
  #get 'profiles/edit'
  #get 'profiles/update'
  get 'documento/show'
  get 'perfil/show'

  # Rotas de notícias
  get '/news', to: 'news#index', as: 'news_index'
  get '/news/:id', to: 'news#show', as: 'news_item'

  # Páginas principais
  root "home#index"

  resources :perfil
  resources :documento
  resource :profile, only: [:edit, :update]
end
