Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount ShopifyApp::Engine, at: '/'
  
  root :to => 'home#index'


end
