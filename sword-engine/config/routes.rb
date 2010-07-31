Rails::Application.routes.draw do |map|
  resources :pages

  resources :sites

  resources :gadgets

  resources :positions

  resources :users
  resources :themes

  resources :roles
  resources :components
  resources :menus
  resources :operations

  root :to => "pages#index", :layout => "home"

end
