Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 管理者用
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
  sessions: "admins/sessions"
}

  # 会員用
  devise_for :users, skip: [:passwords] , controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}

   # 管理者用
  namespace :admins do
    # Top画面
    root to: 'homes#top'

    # 会員一覧・管理関連
    get '/users', to: 'users#index', as: 'users_index'
    get '/users/:id', to: 'users#show', as: 'users_show'
    get '/users/:id/edit', to: 'users#edit', as: 'users_edit'
    patch 'users/update'

    # 言語一覧
    get '/genres', to: 'genres#index', as: 'genres_index'
    get '/genres/:id', to: 'genres#show', as: 'genres_show'

    # 投稿関連
    get '/posts', to: 'posts#index', as: 'posts_index'
    get '/posts/:id', to: 'posts#show', as: 'posts_show'
    delete 'posts/destroy'

    # コメント関連
    get '/comments', to: 'comments#index', as: 'comments_index'
    get '/comments/:id', to: 'comments#show', as: 'comments_show'
    delete 'comments/destroy'

    # 検索
    get "/search" => 'searches#search'
    get '/searches', to: 'searches#index', as: 'searches_index'
  end


  # 会員用
  # Top画面
  root to: 'users/homes#top'

  scope module: :users do
    # ホーム
    get '/home', to: 'users#show'
    get '/infomation/edit', to: 'users#edit'
    patch 'users/update'

    # 言語一覧
    get '/genres/:id', to: 'genres#index', as: 'genres_index'
    get '/genres/:id', to: 'genres#show', as: 'genres_show'

    # 投稿関連
    get '/posts/new', to: 'posts#new', as: 'posts_new'
    post '/posts/create' => 'posts#create'
    get '/posts/:id/edit', to: 'posts#edit', as: 'posts_edit'
    patch 'posts/update'
    get '/posts', to: 'posts#index', as: 'posts_index'
    get '/posts/:id', to: 'posts#show', as: 'posts_show'

    # コメント関連
    post 'comments/create'
    get '/comments/:id', to: 'comments#edit', as: 'comments_edit'
    patch 'comments/update'
    delete 'comments/destroy'

    # 検索
    get "search" => 'searches#search'
    get '/searches', to: 'searches#index', as: 'searches_index'

    # お気に入り
    post 'favorites/create'
    delete 'favorites/destroy'
    get '/favorites', to: 'favorites#index', as: 'favorites_index'
  end
end
