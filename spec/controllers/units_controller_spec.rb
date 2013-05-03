require 'spec_helper'

describe UnitsController do

	it "displays an error for a missing unit" do
		get :show, :id => "not-here", :building_id => "hello"
		response.should redirect_to(building_units_path)
		message = "The unit you were looking for could not be found."
		flash[:alert].should == message
	end
end
