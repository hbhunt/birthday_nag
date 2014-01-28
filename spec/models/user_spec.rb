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

end