Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pictures do
  resources :comments, only: [:create ]
end
  resources :pictures do
    resources :likes
  end
  resources :users, only: [:show ]
  root 'pictures#index'
end
