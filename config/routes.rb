Rails.application.routes.draw do
  
  resources :posts#, only: [:new, :create, :index]
  
  resources :sessions#, only: [:new, :create, :destroy]
  
  resources :users#, only: [:new, :create, :show]
  
  get "home/top" => "home#top"
  root "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
