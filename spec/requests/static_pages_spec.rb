require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    
    it "should have the content 'NAG'" do
      visit '/'
      expect(page).to have_content('NAG')
    end

  end
end
