Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
=======
  #get 'profiles/edit'
  #get 'profiles/update'
>>>>>>> origin/main
  get 'documento/show'
  get 'perfil/show'

  # Rotas de notícias
  get '/news', to: 'news#index', as: 'news_index'
  get '/news/:id', to: 'news#show', as: 'news_item'

  # Páginas principais
  root "home#index"

<<<<<<< HEAD
  # Rotas do main
=======
>>>>>>> origin/main
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
<<<<<<< HEAD

  # 🔹 Rotas da feature Feedback
  resources :perfil
  resources :documento
  resources :feedbacks, only: [:new, :create, :index, :show]
end
=======
end
>>>>>>> origin/main
