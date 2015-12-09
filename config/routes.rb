Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users do
    resources :projects do
    end
  end

  resources :projects, only: [] do
    member do
      post :share
      get :history
    end
    resources :comments, only: [:new, :create]
  end

  resources :classrooms
  resources :schools

  resources :invitations, only: :create do
    member do
      patch :accept
      patch :reject
    end
  end

  get '/projects/:id', to: 'projects#show', as: :view_project
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  root to: 'welcome#index'
end
