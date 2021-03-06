Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :books do
    resources :recipes
  end
  get "/books/:id", to: "books#show"
end
