SoapApp::Application.routes.draw do

  get "pages/home"

  get "user/index"
  post "user/new"
  get "user/new"

  get "control/new"
  get "control/codes"
  get "control/restar"

  match "/about", :to => "pages#about"


  match '/signout', :to => 'user#destroy'

  root :to => 'user#index'
end
