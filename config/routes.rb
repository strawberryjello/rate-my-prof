Rails.application.routes.draw do
  root 'home#index'

  resources :professors do
    resources :reviews
  end

  resources :my_classes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
