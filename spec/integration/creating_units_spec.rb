require 'spec_helper'

feature 'Creating Units' do
	scenario "can create a unit" do
		Factory(:building, :name => "Empire State")
		visit '/'
		click_link 'Empire State'
		click_link 'Add Unit'
		fill_in 'Unit Number', :with => "A101"
		fill_in 'Rent', :with => 100.00
		click_button 'Create Unit'
		page.should have_content('Unit has been added.')
	end
end
