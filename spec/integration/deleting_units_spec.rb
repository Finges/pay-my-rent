require 'spec_helper'

feature "Deleting Units" do
	scenario "Deleting a unit" do
		building = Factory(:building, :name => "Empire State")
		unit = Factory(:unit, :unit_num => "A101", :building_id => building.id)

		visit "/buildings"
		click_link "Empire State"
		click_link "A101"
		click_link "Delete Unit"
		page.should have_content("Unit has been deleted.")

		visit "/buildings"
		page.should_not have_content("A101")
	end
end
