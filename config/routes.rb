Rails.application.routes.draw do
  get '/livetraffic', to: 'trajets#courant'
  get 'pages/home'
  devise_for :users
  # get 'trajets/show'
  # get 'trajets/create'
  # get 'trajets/new'
  # get 'trajets/edit'
  # get 'trajets/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trajets
  root to: "pages#home"
end
