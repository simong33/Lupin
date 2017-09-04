Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  get "/:user" => "users#show", as: :user_dashboard
  get "/:user/competitors/new" => "competitors#new"
  post "/:user/competitors" => "competitors#create", as: :user_competitors
  post "/:user/targets" => "targets#create", as: :user_targets
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
