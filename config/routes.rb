Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount ShopifyApp::Engine, at: '/'
  
  root :to => 'home#index'

  resources :products do

  	resources :stocks do
  	
  	end

  end

  resources :setup_requests do
  end

  resources :faq do

  end

  resources :product_profiles do
    
  end


end
