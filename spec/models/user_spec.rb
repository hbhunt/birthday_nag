require 'spec_helper'

describe User do

	before { @user = FactoryGirl.create(:user) }

	subject { @user }

	it { should be_valid }
	it { should respond_to(:email) }
	it { should respond_to(:reminders) }
	it { should respond_to(:future_reminders) }
	it { should respond_to(:past_reminders) }

	describe "when email address is already taken" do
		it {
			expect { FactoryGirl.create(:user, email: @user.email) }.to raise_error
		}
	end

	describe "reminder associations" do
		before { @user.save }
		let!(:sooner_reminder) do
			FactoryGirl.create(:reminder, user: @user, event_date: 1.week.from_now)
		end
		let!(:later_reminder) do
			FactoryGirl.create(:reminder, user: @user, event_date: 2.weeks.from_now)
		end

		it "should have the right reminders in the right order" do
			expect(@user.reminders.to_a).to eq [sooner_reminder, later_reminder]
		end

		it "should destroy associated reminders" do
			reminders = @user.reminders.to_a
			@user.destroy
			expect(reminders).to_not be_empty
			reminders.each do |reminder|
				expect(Reminder.where(id: reminder.id)).to be_empty
			end
		end
	end

end