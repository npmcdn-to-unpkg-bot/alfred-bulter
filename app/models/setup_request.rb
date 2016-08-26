class SetupRequest < ActiveRecord::Base

	belongs_to :shop

	state_machine initial: :pending do
		
		event :sent do
			transition all => :sent
		end

		event :readed do
			transition all => :readed
		end

		event :proccessing do
			transition all => :proccessing
		end

		event :completed do
			transition all => :completed
		end

	end

	def email
		self.shop.email
	end

end
