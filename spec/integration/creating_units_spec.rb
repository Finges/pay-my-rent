require 'spec_helper'

feature 'Creating Units' do
	before do
		Factory(:building, :name => "Empire State")
		visit '/buildings'
		click_link 'Empire State'
		click_link 'Add Unit'
	end
	scenario "can create a unit" do
		fill_in 'Unit Number', :with => "A101"
		fill_in 'Rent', :with => 100.00
		click_button 'Create Unit'
		page.should have_content('Unit has been added.')
	end
	scenario "can not create a unit without a unit number" do
		fill_in 'Unit Number', :with => ""
		click_button 'Create Unit'

		page.should have_content('Unit has not been added.')
	end


end
