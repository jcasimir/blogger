require 'spec_helper'

describe "Authorization Requests" do
  describe "/" do
    context "when no user is logged in" do
      it "does not show the Create Article link" do
        visit '/'
        expect(page).to_not have_link('new_article')
      end
    end

    context "when a non-author user is logged in" do
      it "does not show the Create Article link" do
        visit '/'
        expect(page).to_not have_link('new_article')
      end
    end

    context "when an author is logged in" do
      let(:jeff){ Author.create(:username => 'jcasimir',
                                :password => 'password')}

      it "shows the Create Article link" do
        visit '/login'
        fill_in 'username', :with => jeff.username
        fill_in 'password', :with => jeff.password
        click_link_or_button 'sign_in'
        visit '/'
        expect(page).to have_link('new_article')
      end
    end
  end
end