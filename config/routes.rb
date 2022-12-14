Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy]
  end
  resources :posts, only: %i[index show] do
    resources :comments, only: %i[new create destroy]
    resources :likes, only: :create
  end
end
