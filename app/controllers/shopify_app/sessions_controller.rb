module ShopifyApp
  class SessionsController < ApplicationController
    include ShopifyApp::SessionsConcern
  
    def callback
      if response = request.env['omniauth.auth']
        shop_name = response.uid
        token = response['credentials']['token']

        sess = ShopifyAPI::Session.new(shop_name, token)
        session[:shopify] = ShopifyApp::SessionRepository.store(sess)
        session[:shopify_domain] = shop_name

        shop = ::Shop.find_or_create_by(shopify_domain: shop_name)
        if shop.shopify_token.blank? or shop.shopify_token != token
        	shop.shopify_token = token
        	shop.save
       	end

        WebhooksManager.queue(shop_name, token) if ShopifyApp.configuration.has_webhooks?
        ScripttagsManager.queue(shop_name, token) if ShopifyApp.configuration.has_scripttags?

        flash[:notice] = I18n.t('.logged_in')
        redirect_to_with_fallback return_address
      else
        flash[:error] = I18n.t('could_not_log_in')
        redirect_to_with_fallback login_url
      end
    end

  protected

	def authenticate
		if shop_name = sanitize_shop_param(params)
			fullpage_redirect_to "/auth/shopify?shop=#{shop_name}"
		else
			redirect_to_with_fallback return_address
		end
	end

  end
end
