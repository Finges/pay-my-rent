require 'spec_helper'

describe UnitsController do
	let(:user) { Factory(:confirmed_user) }
	let(:building) { Factory(:building) }
	let(:unit) { mock_model(Unit, :id => 1) }

	context "standard users" do
		before do
			sign_in(:user, user)
			Factory(:building, :name => "Empire State")
		end

		{ :new => :get,
			:create => :post,
			:edit => :get,
			:update => :put,
			:destroy => :delete }.each do |action,method|
				it "cannot access the #{action} action" do
					sign_in(:user, user)
					send(method, action, :id => unit.id, :building_id => building.id)
					response.should redirect_to(root_path)
					flash[:alert].should == "You must be an admin or landlord to do that."
				end
			end
	end


	it "displays an error for a missing unit" do
		get :show, :id => "not-here", :building_id => "hello"
		response.should redirect_to(building_units_path)
		message = "The unit you were looking for could not be found."
		flash[:alert].should == message
	end
end
