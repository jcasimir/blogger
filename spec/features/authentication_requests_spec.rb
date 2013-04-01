require 'spec_helper'

describe "Authentication Requests" do
  describe "/login" do
    it "has a #username field" do
      visit "/login"
      expect(page).to have_field("#username")
    end

    it "has a #password field" do
      pending
      visit "/login"
      expect(page).to have_field("#username")
    end

    it "has a #sign_in button" do
      pending
      visit "/login"
      expect(page).to have_link("#sign_in")
    end

    context "when there is a registered user" do
      it "logs the user in" do
        pending
        User.create(:username => "Jeff", :password => "Password")
        visit '/login'
        fill_in '#username', :with => "Jeff"
        fill_in '#password', :with => "Password"
        click_link '#sign_in'
        expect(page).to have_content("Welcome, Jeff!")
      end
    end
  end
end
