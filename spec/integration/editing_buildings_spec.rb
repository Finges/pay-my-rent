require 'spec_helper'

feature "Editing buildings" do
	before do
		Factory(:building, :name => "Empire State")
		visit "/"
		click_link "Empire State"
		click_link "Edit Building"
	end	
	scenario 'Updating a building' do
		fill_in "Name", :with => "Columbia Tower"
		click_button "Update Building"
		page.should have_content("Building has been updated.")
	end

	scenario 'Editing with empty name' do
		fill_in "Name", :with => ""
		click_button "Update Building"
		page.should have_content("Building was not updated.")
	end
end
