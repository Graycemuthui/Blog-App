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

  get 'users/:user_id/posts_list', to: 'api#list_posts', as: :list_posts
  get 'users/:user_id/posts/:post_id/comments_list', to: 'api#list_comments', as: :list_comments
  post 'users/:user_id/posts/:post_id/comment_create', to: 'api#create_comment', as: :create_comment
end
