Procurable::Application.routes.draw do
  devise_for :users
  resources :stores
  resources :items
  root to: "stores#index"
end
