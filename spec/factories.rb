FactoryGirl.define do
	factory :user do
		sequence(:email)  		{ |n| "user#{n}@example.com" }
		password				"12345678"
		password_confirmation	"12345678"
	end

	factory :reminder do
		sequence(:name)		{ |n| "Great reminder #{n}" }
		event_date			1.day.from_now
		user
	end
end