require 'spec_helper'

describe "Authentication Requests" do
  describe "/login" do
    it "has a #username field" do
      visit "/login"
      expect(page).to have_field("username")
    end

    it "has a #password field" do
      visit "/login"
      expect(page).to have_field("password")
    end

    context "when there is a registered user" do
      it "logs the user in" do
        User.create(:username => "Jeff", :password => "Password")
        expect(User.first).to be
        visit '/login'
        fill_in 'username', :with => "Jeff"
        fill_in 'password', :with => "Password"
        click_link_or_button 'sign_in'
        expect(current_path).to eq "/"
        expect(page).to have_content("Welcome, Jeff!")
      end

      context "when the password is wrong" do
        it "fails to login" do
          User.create(:username => "Jeff", :password => "Password")
          visit '/login'
          fill_in 'username', :with => "Jeff"
          fill_in 'password', :with => "not_password"
          click_link_or_button 'sign_in'
          expect(current_path).to eq "/login"
          within('p.flash') do
            expect(page).to have_content "failed"
          end
        end
      end
    end

    context "when there is no registered user" do
      it "does not allow login" do
        visit '/login'
        fill_in 'username', :with => "Jeff"
        fill_in 'password', :with => "Password"
        click_link_or_button 'sign_in'
        expect(current_path).to eq "/login"
        within('p.flash') do
          expect(page).to have_content "failed"
        end
      end
    end
  end
end
