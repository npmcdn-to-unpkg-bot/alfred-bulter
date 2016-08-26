class SetupRequestsController < ApplicationController
	layout 'embedded_app'

	def index
		respond_to do |format|
			format.html
			format.json { render json: SetupRequestDatatable.new(view_context) }
		end
	end

	def new
		@setup = current_shop.setup_requests.new
		@setup = @setup.decorate
		respond_to do |format|
			format.html
		end
	end

	def create
		@setup = current_shop.setup_requests.new(permitted_params.setup_request)
		if @setup.save
			redirect_to root_url, notice: "Setup created."
		else
			@setup = @setup.decorate
			render :new
		end
	end

	def edit
	end

	def update
	end


end
