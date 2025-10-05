Rails.application.routes.draw do
  # Notícias
  get '/news', to: 'news#index', as: 'news_index'
  get '/news/:id', to: 'news#show', as: 'news_item'

  # Página inicial
  root "home#index"

  # Perfil (usuário logado)
  resource :profile, only: [:edit, :update]

  # Sessões
  get 'login',      to: 'login#new'
  post 'login',     to: 'login#create'
  delete 'logout',  to: 'login#destroy'

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

  # Feedbacks
  resources :feedbacks, only: [:index, :show, :new, :create]

  # Usuários
  resources :usuarios
end
