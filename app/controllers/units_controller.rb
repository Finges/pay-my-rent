class UnitsController < ApplicationController

	def index
		@units = Unit.all
		@building = Building.find(params[:building_id])
		
	end
	def new
		@unit = Unit.new(:building_id => params[:building_id])
		@building = Building.find(params[:building_id])
	end

	def create
		@unit = Unit.new(params[:unit])
		@building = Building.find(params[:building_id])
		if @unit.save
			flash[:notice] = "Unit has been added."
			redirect_to [@building,@unit]
		else
			flash[:error] = "Unit was not added."
			render :action => "new"
		end
	end

	def show
		@unit = Unit.find(params[:id])
	end
end
