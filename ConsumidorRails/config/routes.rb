SoapApp::Application.routes.draw do

  get "pages/home"

  get "users/index"
  post "users/new"
  get "users/new"
  get "users/show"
  get "users/detalles"

  get "control/new"
  get "control/codes"
  get "control/restar"

  match "/about", :to => "pages#about"

  match '/signout', :to => 'users#destroy'

  root :to => 'users#index'
end
