Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get "/", to: "main#index", as: :main_index

  post "/plateau/create", to: "plateau#create", as: :plateau_create
end
