require 'spec_helper'

describe Reminder do

	let(:user) { FactoryGirl.create(:user) }
	before { @reminder = user.reminders.build(name: "Lorem ipsum") }

	describe "when user_id is not present" do
		before { @reminder.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank name" do
		before { @reminder.name = " " }
		it { should_not be_valid }
	end

	describe "with content that is too long" do
		before { @reminder.name = "a" * 141 }
		it { should_not be_valid }
	end

end