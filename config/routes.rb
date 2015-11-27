Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users do
    resources :projects do
      get :history, on: :member
    end
  end

  resources :projects, only: [] do
    resources :comments, only: [:new, :create]
  end

  get '/projects/:id', to: 'projects#show', as: :view_project
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  root to: 'welcome#index'
end
