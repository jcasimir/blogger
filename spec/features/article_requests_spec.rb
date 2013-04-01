require 'spec_helper'

describe "Article Requests" do
  describe "/" do
    it "shows the title" do
      visit "/"
      expect(page).to have_content("ZOMG IT'S A BLOG!")
    end

    context "when a user is logged in" do
      let!(:jeff){ User.create(:username => "jcasimir", 
                        :password => "password", 
                        :first_name => "Jeff")}

      it "links to the logout page" do
        visit '/login'
        fill_in 'username', :with => jeff.username
        fill_in 'password', :with => "password"
        click_link_or_button 'sign_in'
        expect(page).to have_link('sign_out', :href => '/logout')
      end
    end

    context "when no user is logged in" do
      before(:each) do
        Article.create(:body => "Sample Article Body", :title => "The Title!")
      end

      it "shows the articles" do
        visit "/"
        expect(page).to have_content('The Title!')
      end

      it "links to the login page" do
        visit "/"
        click_link('sign_in')
        expect(current_path).to eq '/login'
      end
    end
  end
end
