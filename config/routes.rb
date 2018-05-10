Rails.application.routes.draw do
  root 'home#index'
  resources :reviews
  resources :my_classes
  resources :professors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
