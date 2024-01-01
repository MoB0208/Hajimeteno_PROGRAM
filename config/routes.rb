Rails.application.routes.draw do

  # 管理者用
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  # 会員用
  devise_for :users, skip: [:passwords] , controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   # 管理者用
  namespace :admin do
    get '/admin', to: 'homes#top'
  end
  namespace :admin do
    get '/admin/users', to: 'users#index', as: 'users_index'
    get '/admin/users/:id', to: 'users#show', as: 'users_show'
    get '/admin/users/:id/edit', to: 'users#edit', as: 'users_edit'
    patch 'users/update'
  end
  namespace :admin do
    get '/admin/genres', to: 'genres#index', as: 'genres_index'
    get '/admin/genres/:id', to: 'genres#show', as: 'genres_show'
  end
  namespace :admin do
    get '/admin/posts', to: 'posts#index', as: 'posts_index'
    get '/admin/posts/:id', to: 'posts#show', as: 'posts_show'
    delete 'posts/destroy'
  end
  namespace :admin do
    get '/admin/comments', to: 'comments#index', as: 'comments_index'
    get '/admin/comments/:id', to: 'comments#show', as: 'comments_show'
    delete 'comments/destroy'
  end
  namespace :admin do
    get "search" => 'searches#search'
    get '/admin/searches', to: 'searches#index', as: 'searches_index'
  end


  # 会員用
  namespace :user do
    root to: 'homes#top'
  end
  namespace :user do
    get '/home', to: 'users#show'
    get '/infomation/edit', to: 'users#edit'
    patch 'users/update'
  end
  namespace :user do
    get '/genres/:id', to: 'genres#index', as: 'genres_index'
    get '/genres/:id', to: 'genres#show', as: 'genres_show'
  end
  namespace :user do
    get '/posts/new', to: 'posts#new', as: 'posts_new'
    get '/posts/:id/edit', to: 'posts#edit', as: 'posts_edit'
    patch 'posts/update'
    get '/posts', to: 'posts#index', as: 'posts_index'
    get '/posts/:id', to: 'posts#show', as: 'posts_show'
  end
  namespace :user do
    post 'comments/create'
    get '/comments/:id', to: 'comments#edit', as: 'comments_edit'
    patch 'comments/update'
    delete 'comments/destroy'
  end
  namespace :user do
    get "search" => 'searches#search'
    get '/searches', to: 'searches#index', as: 'searches_index'
  end
  namespace :user do
    post 'favorites/create'
    delete 'favorites/destroy'
    get '/favorites', to: 'favorites#index', as: 'favorites_index'
  end
end
