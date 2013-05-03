require 'spec_helper'

describe BuildingsController do
	it "displays an error for a missing project" do
		get :show, :id => "not-here"
		response.should redirect_to(buildings_path)
		message = "The building you were looking for could not be found."
		flash[:alert].should == message
	end
end