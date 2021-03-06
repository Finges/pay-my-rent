class UnitsController < ApplicationController
	before_filter :authorize_admin!, :except => [:index, :show]
	before_filter :find_unit, :only => [:show, :edit, :update, :destroy]	
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

	def destroy
		@unit = Unit.find(params[:id])
		@unit.destroy
		flash[:notice] = "Unit has been deleted."
		redirect_to building_units_path
	end

	private
		def find_unit
			@unit = Unit.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The unit you were looking for could not be found."
			redirect_to building_units_path
		end

end
