Rails.application.routes.draw do
  
  resources :users#, only: [:new, :create, :show]
  
  get "home/top" => "home#top"
  root "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
