FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"
		password_confirmation "password"
		phone "555-555-5555"
		sequence(:name) { |n| "User Name#{n}" }
	

		factory :confirmed_user do
			after_create do |user|
				user.confirm!
			end
		end

		factory :admin_user do
			after_create do |user|
				user.confirm!
				user.update_attribute(:admin, true)
			end
		end

		factory :landlord_user do
			after_create do |user|
				user.confirm!
				user.update_attribute(:landlord, true)
			end
		end
	end	
end