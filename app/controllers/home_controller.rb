class HomeController < ShopifyApp::AuthenticatedController
  def index
	if current_shop.present?
		@profile = current_shop.profiles.first
		if @profile.blank?
			@profile = current_shop.profiles.new
			@profile.name = "My Profile"
		end


	end
  end

end
