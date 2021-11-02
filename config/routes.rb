Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get '/home/about' => 'homes#about'
  get '/search' => 'searchs#search'

  resources :books, only:[:new,:create,:index,:show,:edit,:update,:destroy] do
    resource :favorites, only:[:create,:destroy]
    resources :post_comments, only:[:create,:destroy]
  end

  resources :users, only:[:show,:edit,:update,:index] do
    resource :relationships, only:[:create,:destroy]
    get 'followings' => 'users#followings', as: 'followings'
    get 'followers' => 'users#followers', as: 'followers'
  end

end
