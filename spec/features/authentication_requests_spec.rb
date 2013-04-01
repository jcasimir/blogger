require 'spec_helper'

describe "Authentication Requests" do
  let!(:jeff){ User.create(:username => "jcasimir", 
                          :password => "password", 
                          :first_name => "Jeff")}

  describe "/logout" do
    context "when a user is currently logged in" do
      it "logs them out and returns to the index" do
        visit '/login'
        fill_in 'username', :with => jeff.username
        fill_in 'password', :with => "password"
        click_link_or_button 'sign_in'
        visit '/logout'
        expect(current_path).to eq "/"
        within("p.flash") do
          expect(page).to have_content "logged out"
        end
        expect(page).to have_link('sign_in')
      end
    end
  end

  describe "/login" do
    it "has no flash" do
      visit '/login'
      expect(page).to_not have_css('p.flash')
    end

    it "has a #username field" do
      visit "/login"
      expect(page).to have_field("username")
    end

    it "has a #password field" do
      visit "/login"
      expect(page).to have_field("password", :type => 'password')
    end

    context "when there is a registered user" do
      let(:john){ User.create(:username => "jmaddux", 
                              :password => "john_pw", 
                              :first_name => "John")}

      it "logs the user in" do
        visit '/login'
        fill_in 'username', :with => jeff.username
        fill_in 'password', :with => "password"
        click_link_or_button 'sign_in'
        expect(current_path).to eq "/"
        expect(page).to have_content("Welcome, #{jeff}")
      end

      it "logs in the correct user" do
        visit '/login'
        fill_in 'username', :with => john.username
        fill_in 'password', :with => "john_pw"
        click_link_or_button 'sign_in'
        expect(current_path).to eq "/"
        expect(page).to have_content("Welcome, #{john}")
      end

      context "when the password is wrong" do
        it "fails to login" do
          visit '/login'
          fill_in 'username', :with => jeff.username
          fill_in 'password', :with => "password" + "crap"
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
