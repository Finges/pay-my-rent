class BuildingsController < ApplicationController
	before_filter :authorize_admin!, :except => [:index, :show]
	before_filter :find_building, :only => [:show, :edit, :update, :destroy]
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

	private
		def find_building
			@building = Building.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The building you were looking for could not be found."
			redirect_to buildings_path
		end

		def authorize_admin!
			authenticate_user!
			unless current_user.admin?
				flash[:alert] = "You must be an admin or landlord to do that."
				redirect_to root_path
			end
		end		
end
