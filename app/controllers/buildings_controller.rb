class BuildingsController < ApplicationController

	def index
		@buildings = Building.all	
	end

	def new
		@building = Building.new	
	end

	def create
		@building = Building.new(params[:building])
		if @building.save
			flash[:notice] = "Building has been created."
			redirect_to @building
		else
			flash[:error] = "Building has not been created."
			render :action => "new"
		end
	end

	def show
		@building = Building.find(params[:id])
	end

	def edit
		@building = Building.find(params[:id])
	end

	def update
		@building = Building.find(params[:id])

		if @building.update_attributes(params[:building])
			flash[:notice] = "Building has been updated."
			redirect_to @building
		else
			flash[:error] = "Building was not updated."
			render :action => "edit"
		end
	end

	def destroy
		@building = Building.find(params[:id])
		@building.destroy
		flash[:notice] = "Building has been deleted."
		redirect_to buildings_path
	end
end
