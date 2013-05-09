require 'spec_helper'

describe BuildingsController do
	let(:user) { Factory(:confirmed_user) }
	let(:building) {mock_model(Building, :id => 1)}

	context "standard users" do
		before do
			sign_in(:user, user)
		end
		{ :new => :get, 
			:create => :post,
			:edit => :get,
			:update => :put, 
			:destroy => :delete }.each do |action, method|
				it "cannot access the #{action} action" do
					send(method, action, :id => building.id)
					response.should redirect_to('/')
					flash[:alert].should == "You must be an admin or landlord to do that."
				end
			end
	end

	it "displays an error for a missing building" do
		get :show, :id => "not-here"
		response.should redirect_to(buildings_path)
		message = "The building you were looking for could not be found."
		flash[:alert].should == message
	end
end