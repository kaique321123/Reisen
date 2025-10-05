Rails.application.routes.draw do
  # Página inicial
  root "home#index"

  # Sessões de login
  get    'login',  to: 'login#new'
  post   'login',  to: 'login#create'
  delete 'logout', to: 'login#destroy'

  # Notícias
  get '/news',      to: 'news#index', as: 'news_index'
  get '/news/:id',  to: 'news#show',  as: 'news_item'

  # Mock de testes
  if Rails.env.test?
    get '/mock/latam', to: 'mocks#latam'
    get '/mock/gol',   to: 'mocks#gol'
    get '/mock/azul',  to: 'mocks#azul'
    get '/mock/erro',  to: 'mocks#erro'
  end

  # Recursos principais
  resources :perfis do
    resources :documentos
    resources :checklists
  end

  resources :usuarios
  resources :feedbacks, only: [:new, :create, :index, :show]
end
