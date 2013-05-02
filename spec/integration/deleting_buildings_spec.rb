require "spec_helper"

feature "Deleting buildings" do
	scenario "Deleting a building" do
		Factory(:building, :name => "Empire State")
		visit "/"
		click_link "Empire State"
		click_link "Delete Building"
		page.should have_content("Building has been deleted")

		visit "/"
		page.should_not have_content("Empire State")
	end
end

