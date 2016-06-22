class ShopDecorator < Draper::Decorator
  delegate_all

  def name
  	object.shopify_domain.split(".").first
  end

end
