Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get "/:user" => "users#show", as: :user_dashboard
  get "/:user/competitors/new" => "competitors#new"
  post "/:user/competitors" => "competitors#create", as: :user_competitors
  post "/:user/targets" => "targets#create", as: :user_targets
  get "/:user/competitors" => "competitors#my_competitors", as: :my_competitors
  root to: 'pages#home'

end
