namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		users = User.all(limit: 6)
		50.times do
			name = Faker::Lorem.sentence(1)
			event_date = Date.today + (10000*rand())
			users.each { |user| user.reminders.create!(name: name, event_date: event_date ) }
		end
	end
end