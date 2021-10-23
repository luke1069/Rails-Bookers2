Rails.application.routes.draw do
  devise_for :users , controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root to:'homes#top'
  get 'about' => 'homes#about'

  resources :books, only:[:new,:create,:index,:show,:edit,:update,:destroy]
  resources :users, only:[:show,:edit,:update,:index]
end
