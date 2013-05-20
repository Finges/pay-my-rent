require "spec_helper"

feature "Landlord Landing page" do
	let!(:landlord) { Factory(:landlord) }
	let!(:empire_state) { Factory(:building, :name => "Empire State", :landlord => landlord) }
	let!(:columbia_tower) { Factory(:building, :name => "Columbia Tower", :landlord => landlord) }

	before do
		visit '/users/sign_in'
		fill_in "Email", :with => landlord.email
		fill_in "Password", :with => "password"
		click_button "Sign in"
	end
  scenario "Displays all buildings belonging to the landlord" do
  	save_and_open_page
    page.should have_content("Empire State")
    page.should have_content("Columbia Tower")
  end
end