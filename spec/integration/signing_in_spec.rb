require 'spec_helper'

feature 'Signing in' do
	before do
		Factory(:user, :email => "paymyrent@example.com")
		Factory(:landlord)
	end
	scenario 'Signing in via confirmation' do
		open_email "paymyrent@example.com", :with_subject => /Confirmation/
		click_first_link_in_email
		page.should have_content("Your account was successfully confirmed")
		page.should have_content("Signed in as paymyrent@example.com")
	end

	scenario 'Signing in via form' do
		User.find_by_email('paymyrent@example.com').confirm!
		visit '/'
		click_link 'Sign in'
		fill_in 'Email', :with => 'paymyrent@example.com'
		fill_in 'Password', :with => 'password'
		click_button 'Sign in'
		page.should have_content("Signed in successfully.")
	end

	scenario 'Signing in as a landlord, lands you on the landlord dashboard' do
		visit '/'
		click_link "Sign in"
		fill_in "Email", with: Landlord.first.email
		fill_in "Password", with: "password"
		click_button 'Sign in'
		page.should have_content("Signed in successfully.")
		page.current_url.should == landlord_index_url
	end

end

