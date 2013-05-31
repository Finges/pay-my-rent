require 'spec_helper'

feature "Viewing Buildings" do
	scenario "listing all buildings" do
		building = Factory.create(:building, :name => "Empire State")
		visit '/buildings'
		click_link 'Empire State'
		save_and_open_page
			page.current_url.should == building_url(building)
	end
end
