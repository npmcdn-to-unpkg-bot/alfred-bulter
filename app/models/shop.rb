class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def generate_avatar
  	img = Avatarly.generate_avatar(self.shopify_domain[0].to_s.capitalize, opts={})
  	file = Tempfile.new([self.shopify_domain, '.png'])
  	File.open(file.path, 'wb') do |f|
    	f.write img
  	end
  	self.avatar = file
  	self.save
  end

  def get_email
	session = ShopifyAPI::Session.new(self.shopify_domain, self.shopify_token)
	ShopifyAPI::Base.activate_session(session)
	shop = ShopifyAPI::Shop.current
	self.email = shop.email
	self.save
  end

end
