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

	def self.varinat(shop,variant_id)
		begin
			activate_session(shop)
			ShopifyAPI::Product.find(product_id)
		rescue Exception => e
			return nil
		end
	end

	def self.variants_count(shop)
		begin
			activate_session(shop)
			ShopifyAPI::Variant.all.count
		rescue Exception => e
			return 0
		end
	end

	def self.products(shop,page = 1,per_page = 10)
		begin
			activate_session(shop)
			curr_products = ShopifyAPI::Product.find(:all, :params => {:limit => per_page, :page => page })
			ShopifyAPI::Base.clear_session
			curr_products
		rescue Exception => e
			return nil
		end
	end

	def self.products_count(shop)
		begin
			activate_session(shop)
			ShopifyAPI::Product.all.count
		rescue Exception => e
			return 0
		end
	end

	def self.product(shop,product_id)
		begin
			activate_session(shop)
			ShopifyAPI::Product.find(product_id)
		rescue Exception => e
			return nil
		end
	end

end		