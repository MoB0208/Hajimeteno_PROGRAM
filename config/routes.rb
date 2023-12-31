Rails.application.routes.draw do

  namespace :admin do
    get 'searches/search'
    get 'searches/index'
  end
  namespace :user do
    get 'searches/search'
    get 'searches/index'
  end
  namespace :user do
    get 'comments/create'
    get 'comments/edit'
    get 'comments/update'
    get 'comments/destroy'
  end
  namespace :user do
    get 'favorites/create'
    get 'favorites/destroy'
    get 'favorites/index'
  end
  namespace :user do
    get 'posts/new'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/index'
    get 'posts/show'
  end
  namespace :user do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :user do
    get 'homes/top'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
    get 'posts/destroy'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
    get 'comments/destroy'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/updete'
  end
  namespace :admin do
    get 'homes/top'
  end
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
end
