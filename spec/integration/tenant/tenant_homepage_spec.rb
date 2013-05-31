require "spec_helper"

feature "Tenant homepage" do
	let!(:tenant) { Factory(:tenant) }
	let!(:building) { Factory(:building) }
	let!(:unit) { Factory(:unit) }
	let!(:payment) { Factory(:payment, :amount => 300.00, 
														:amount_due => 300.00,
														:tenant => tenant) }		
	let!(:payment2) { Factory(:payment, :amount => 350.00, 
														:amount_due => 350.00,
														:tenant => tenant) }			

	before do
		visit "/"
		click_link "Sign in"
		fill_in "Email", with: tenant.email
		fill_in "Password", with: "password"
		click_button "Sign in"
	end
  scenario "Displays tenants name" do
    page.should have_content(tenant.name)
  end

  scenario "Displays tenants payments" do
  	save_and_open_page
    page.should have_content("300.00")
    page.should have_content("350.00")
  end
end