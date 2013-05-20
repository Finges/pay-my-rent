class LandlordController < ApplicationController
	def index
		@landlord = current_user	
	end
end
