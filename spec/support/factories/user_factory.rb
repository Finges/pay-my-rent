FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"
		password_confirmation "password"
		phone "555-555-5555"
		sequence(:name) { |n| "User Name#{n}" }
	end
end