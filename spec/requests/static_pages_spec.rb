require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    
    it "should have the content 'NAG'" do
      visit '/'
      expect(page).to have_content('NAG')
    end

    describe "signed-in" do
		let(:user) { FactoryGirl.create(:user) }
		let!(:r1) { FactoryGirl.create(:reminder, user: user, name: "foo") }
		let!(:r2) { FactoryGirl.create(:reminder, user: user, name: "bar") }

		before { sign_in user }

		subject { page }

		it { should have_content("Sign Out") }

		describe "reminders" do
			it { should have_content(r1.name) }
			it { should have_content(r2.name) }
			it { should have_content(user.reminders.count) }
		end 

		# test past reminders
		# test future reminders
	end

  end
end
