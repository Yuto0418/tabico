Rails.application.routes.draw do
  get 'tweets/index'
  devise_for :users
  root 'users#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
