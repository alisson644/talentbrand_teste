Rails.application.routes.draw do
  resources :annotations
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "annotations#index"
  get '/search', to: 'annotations#search'
end
