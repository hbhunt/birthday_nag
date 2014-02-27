require 'spec_helper'

describe 'Authentication' do

	subject { page }

	describe "signin page" do
    	before { visit new_user_session_path }

    	it { should have_content('Sign in') }
  	end # signin page
	
	describe "with valid information" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }

		it { should have_content("Upcoming Nags") }
	end # with valid information

end # describe Authentication