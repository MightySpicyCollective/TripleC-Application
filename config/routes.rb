Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { passwords: :passwords }

  resources :users do
    resources :projects
  end

  resources :projects, only: [] do
    member do
      post :share
      get :history
      get :compare
      patch :accept_changes
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

  resources :search, only: [:index,:new]

  resources :enquiries, only: :create

  get '/projects/:id', to: 'projects#show', as: :view_project
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get '/contact', to: 'welcome#contact', as: :contact_us
  get '/active_projects', to: 'welcome#active_projects', as: :active_projects
  root to: 'welcome#index'
end
