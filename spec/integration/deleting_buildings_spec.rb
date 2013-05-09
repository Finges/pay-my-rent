require "spec_helper"

feature "Deleting buildings" do
	before do
		sign_in_as!(Factory(:admin_user))
	end
	scenario "Deleting a building" do
		Factory(:building, :name => "Empire State")
		visit "/buildings"
		click_link "Empire State"
		click_link "Delete Building"
		page.should have_content("Building has been deleted")

		visit "/buildings"
		page.should_not have_content("Empire State")
	end
end

