require 'spec_helper'

feature 'Editing unit' do
	before do
		building = Factory(:building, :name => 'Empire State')
		Factory(:unit, :unit_num => 'A101', :building_id => building.id)
		visit "/"
		click_link "Empire State"
		click_link "A101"
		click_link "Edit Unit"
	end

	scenario "Updating a unit" do
		fill_in "Unit Num", :with => "B101"
		click_button "Update Unit"
		page.should have_content("Unit has been updated.")
	end

	scenario "Updating a unit with no unit number" do
		fill_in "Unit Num", :with => ""
		click_button "Update Unit"
		page.should have_content("Unit has not been updated.")
	end
	
end