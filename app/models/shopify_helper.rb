class ShopifyHelper
	def self.activate_session(shop)
		session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
		ShopifyAPI::Base.activate_session(session) 
	end

	def self.variants(shop,page = 1,per_page = 10)
		begin
			activate_session(shop)
			curr_variants = ShopifyAPI::Variant.find(:all, :params => {:limit => per_page, :page => page })
			ShopifyAPI::Base.clear_session
			curr_variants
		rescue Exception => e
			return nil
		end
	end

	def self.variants_count(shop)
		activate_session(shop)
		ShopifyAPI::Variant.all.count
	end

	def self.product(shop,product_id)
		activate_session(shop)
		ShopifyAPI::Product.find(product_id)
	end

end		