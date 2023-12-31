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
    get '/admin/users', to: 'users#index'
    get '/admin/users/:id', to: 'users#show'
    get '/admin/users/:id/edit', to: 'users#edit'
    patch 'users/update'
  end
  namespace :admin do
    get '/admin/posts', to: 'posts#index'
    get '/admin/posts/:id', to: 'posts#show'
    delete 'posts/destroy'
  end
  namespace :admin do
    get '/admin/comments', to: 'comments#index'
    get '/admin/comments/:id', to: 'comments#show'
    delete 'comments/destroy'
  end
  namespace :admin do
    get '/admin/searches', to: 'searches#search'
    get '/admin/searches', to: 'searches#index'
  end
  
  
  # 会員用
  namespace :user do
    get 'homes/top'
  end
  namespace :user do
    get 'users/show'
    get 'users/edit'
    patch 'users/update'
  end
  namespace :user do
    get 'posts/new'
    get 'posts/edit'
    patch 'posts/update'
    get 'posts/index'
    get 'posts/show'
  end
  namespace :user do
    post 'comments/create'
    get 'comments/edit'
    patch 'comments/update'
    delete 'comments/destroy'
  end
  namespace :user do
    get 'searches/search'
    get 'searches/index'
  end
  namespace :user do
    post 'favorites/create'
    delete 'favorites/destroy'
    get 'favorites/index'
  end
  
  
  
  
  # namespace :admin do
  #   get 'searches/search'
  #   get 'searches/index'
  # end
  # namespace :user do
  #   get 'searches/search'
  #   get 'searches/index'
  # end
  # namespace :user do
  #   get 'comments/create'
  #   get 'comments/edit'
  #   get 'comments/update'
  #   get 'comments/destroy'
  # end
  # namespace :user do
  #   get 'favorites/create'
  #   get 'favorites/destroy'
  #   get 'favorites/index'
  # end
  # namespace :user do
  #   get 'posts/new'
  #   get 'posts/edit'
  #   get 'posts/update'
  #   get 'posts/index'
  #   get 'posts/show'
  # end
  # namespace :user do
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/update'
  # end
  # namespace :user do
  #   get 'homes/top'
  # end
  # namespace :admin do
  #   get 'posts/index'
  #   get 'posts/show'
  #   get 'posts/destroy'
  # end
  # namespace :admin do
  #   get 'comments/index'
  #   get 'comments/show'
  #   get 'comments/destroy'
  # end
  # namespace :admin do
  #   get 'users/index'
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/updete'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
end
