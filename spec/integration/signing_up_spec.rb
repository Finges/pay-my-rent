require 'spec_helper'

feature 'Signing Up' do
	scenario "Successful sign up" do
		Factory(:unit, :unit_num => "A101")
		visit '/'
		click_link 'Sign up'
		fill_in "Name", :with => "test1"
		fill_in "Phone", :with => "555-555-5555"
		fill_in "Email", :with => "test1@example.com"
		select "A101", :from => "user_unit_id"
		fill_in "Password", :with => "password"
		fill_in "Password confirmation", :with => "password"

		click_button "Sign up"
		message = "Please open the link to activate your account."
		page.should have_content(message)
	end
end
