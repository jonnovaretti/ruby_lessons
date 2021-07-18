Rails.application.routes.draw do
  resources :articles
  root "pages#home"
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
