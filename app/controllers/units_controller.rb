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
		@unit.building_id = @building.id
		if @unit.save
			flash[:notice] = "Unit has been added."
			redirect_to [@building,@unit]
		else
			flash[:error] = "Unit has not been added."
			render :action => "new"
		end
	end

	def show
		@unit = Unit.find(params[:id])
	end

	def edit
		@unit = Unit.find(params[:id])
		@building = Building.find(params[:building_id])
	end

	def update
		@building = Building.find(params[:building_id])
		@unit = Unit.find(params[:id])
		if @unit.update_attributes(params[:unit])
			flash[:notice] = "Unit has been updated."
			redirect_to	[@building,@unit]
		else
			flash[:error] = "Unit has not been updated."
			render :action => "edit"
		end
	end
end
