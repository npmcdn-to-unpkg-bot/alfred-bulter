ShopifyApp.configure do |config|
  config.api_key = Settings.shopify.api.key
  config.secret = Settings.shopify.api.secret
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
