Rails.application.routes.draw do
  devise_for :users
  resources :users do
  resources  :items, only: :create
 end
  root 'users#show'
  get 'welcome/index'

end
