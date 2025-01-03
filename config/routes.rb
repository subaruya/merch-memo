Rails.application.routes.draw do
  root "static_pages#top"
  resources :users, only: %i[new create]
  resources :items, only: %i[index new create show edit destroy]
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
