class StocksController < ApplicationController
	layout 'embedded_app'


	def index
		respond_to do |format|
			format.html
			format.json { render json: VariantDatatable.new(view_context) }
		end
	end

end
