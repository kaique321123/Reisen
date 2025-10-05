Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #get 'profiles/edit'
  #get 'profiles/update'
  get 'documento/show'
  get 'perfil/show'

  # Rotas de notícias
  get '/news', to: 'news#index', as: 'news_index'
  get '/news/:id', to: 'news#show', as: 'news_item'

  # Páginas principais
  root "home#index"

  # Rotas do main
  resource :profile, only: [:edit, :update]

  get 'login',      to: 'login#new'
  post 'login',     to: 'login#create'
  delete 'logout',  to: 'login#destroy'

  if Rails.env.test?
    get '/mock/latam', to: 'mocks#latam'
    get '/mock/gol', to: 'mocks#gol'
    get '/mock/azul', to: 'mocks#azul'
    get '/mock/erro', to: 'mocks#erro'
  end

  resources :perfis do
    resources :documentos
    resources :checklists
  end

  resources :usuario

  # 🔹 Rotas da feature Feedback
  resources :perfil
  resources :documento
  resources :feedbacks, only: [:new, :create, :index, :show]
end
