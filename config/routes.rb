Rails.application.routes.draw do
  
  resources :messages, only: [:create, :destroy]
  
  resources :clips, only: [:index, :create, :destroy]
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  
  get "home/top" => "home#top"
  root "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
