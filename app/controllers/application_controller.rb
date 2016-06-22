class ApplicationController < ActionController::Base
  include ShopifyApp::LoginProtection
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  expose :current_shop, ->{  
    curr_shop = nil
    if Shop.where(shopify_domain: params[:shop]).present?
      curr_shop = Shop.where(shopify_domain: params[:shop]).first 
    elsif Shop.where(shopify_domain: session[:shopify_domain]).present?
		curr_shop = Shop.where(shopify_domain: session[:shopify_domain]).first
    end
   
    if curr_shop.present?
    	begin
    		curr_shop.generate_avatar unless curr_shop.avatar.exists?
    		curr_shop.get_email if curr_shop.present? and curr_shop.email.blank?
    		curr_shop = curr_shop.decorate
    	rescue => e

    	end
    end
    curr_shop
  }


  def default_url_options(options = {})
  	shop_domain = params[:shop]
  	shop_domain = session[:shopify_domain] if shop_domain.blank? and session[:shopify_domain].present?
    options.merge(:shop => shop_domain)
  end



end
