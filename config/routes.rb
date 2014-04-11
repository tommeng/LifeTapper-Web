LifeTapperWeb::Application.routes.draw do
  resources :sessions

  resources :counts

  resources :activities

  get "welcome/index"

  devise_for :users

  devise_scope :user do
    root to: 'welcome#index'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

end
