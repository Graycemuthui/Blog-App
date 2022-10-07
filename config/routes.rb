Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
      delete 'logout', to: 'sessions#destroy'
    end
  end

  root to: 'users#index'
end
