Rails.application.routes.draw do
  root 'static_pages#home'
  get  'static_pages/home'
  
  devise_scope :user do
    get    "sign_up", :to => "users/registrations#new"
    get    "sign_in", :to => "users/sessions#new"
    post   "sign_in", :to => "users/sessions#create"
    delete "log_out", :to => "users/sessions#destroy" 
  end
  
  devise_for :users, :controllers => {
    :registrations      => "users/registrations",
    :sessions           => "users/sessions",
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
  
  resources :posts, 　　　　only: [:index, :show, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :likes,         only: [:create, :destroy]
  resources :comments,      only: [:create, :destroy]
end
