FactoryGirl.define do
	factory :tenant do
		email "tenant@example.com"
		password "password"
		password_confirmation "password"
		name "tenant"
		confirmed_at {Time.now}	
	end
end