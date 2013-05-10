require "spec_helper"

feature "Editing a user" do
	let!(:admin) { Factory(:admin_user) }
	let!(:user) { Factory(:confirmed_user) }

	before do
	  sign_in_as!(admin)
	  visit "/"
	  click_link "Admin"
	  click_link "Users"
	  click_link user.email
	  click_link "Edit User"
	end

  scenario "Updating a users details" do
    fill_in "Email", with: "newemail@example.com"
    click_button "Update User"
    page.should have_content("User has been updated.")
    within("#users") do
    	page.should have_content("newemail@example.com")
    	page.should_not have_content(user.email)
    end
  end
end