Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  root to: 'welcome#index'
end
