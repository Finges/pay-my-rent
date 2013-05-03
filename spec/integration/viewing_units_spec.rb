require 'spec_helper'

feature "Viewing units" do
	scenario "Listing all units" do
		building = Factory(:building, :name => "Empire State")
		unit = Factory(:unit, :unit_num => "A101", :building_id => building.id)

		visit '/buildings'
		click_link 'Empire State'
		click_link 'A101'
		page.current_url.should == building_unit_url(building, unit)
	end
end
