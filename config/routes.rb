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
    resources :users, only: [:show, :edit, :update]

    # 言語一覧
    resources :genres, only: [:show]

    # 投稿関連
    resources :posts, only: [:index, :show, :destroy] do
      # コメント関連
      resources :comments, only: [:index, :show, :destroy]
    end

    # 検索
    get "/search" => 'searches#search'
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
    get 'genres/:id', to: 'genres#show', as: 'genre'

    # 投稿関連
    resources :posts, only: [:new, :create, :edit, :update, :show, :destroy] do
      # お気に入り
      resource :favorites, only: [:create, :destroy]
      # コメント関連
      resources :comments, only: [:create, :edit, :update, :destroy]
    end

    # 検索
    get "search" => 'searches#search'
  end
end
