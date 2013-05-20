require "spec_helper"

feature "Tenant homepage" do
	let!(:tenant) { Factory(:tenant) }
	let!(:building) { Factory(:building) }
	let!(:unit) { Factory(:unit) }

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
end