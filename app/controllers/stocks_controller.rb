class StocksController < ApplicationController

	def index
		respond_to do |format|
			format.json { render json: VariantDatatable.new(view_context) }
		end
	end

end
