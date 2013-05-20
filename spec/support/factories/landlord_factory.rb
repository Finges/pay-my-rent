FactoryGirl.define do
	factory :landlord do
		email "landlord@example.com"
		password "password"
		password_confirmation "password"
		name "landlord"
		confirmed_at Time.now
	end
end