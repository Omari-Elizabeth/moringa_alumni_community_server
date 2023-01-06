Rails.application.routes.draw do
  resources :comments, only:[:index, :create, :show, :update, :destroy]

  resources :announcements
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
