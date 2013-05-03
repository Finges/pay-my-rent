require 'spec_helper'

feature 'Creating Buildings' do
	before do
		visit '/buildings'
		click_link 'New Building'
	end

	scenario "can create a building" do
		fill_in 'Name', :with => 'Empire State'
		fill_in 'Street', :with => '123 Main street'
		fill_in 'City', :with => 'New York'
		fill_in 'State', :with => 'NY'
		fill_in 'Zip', :with => '12345'

		click_button 'Create Building'

		page.should have_content('Building has been created.')
	end

	scenario 'Can not create a building without a name' do
		click_button 'Create Building'
		page.should have_content("Building has not been created.")
		page.should have_content("Name can't be blank")	
	end
end
