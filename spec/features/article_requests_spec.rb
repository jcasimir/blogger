require 'spec_helper'

describe "Article Requests" do
  describe "/" do
    it "shows the title" do
      visit "/"
      expect(page).to have_content("ZOMG IT'S A BLOG!")
    end

    context "when no user is logged in" do
      before(:each) do
        Article.create(:body => "Sample Article Body", :title => "The Title!")
      end

      it "shows the articles" do
        visit "/"
        expect(page).to have_content('The Title!')
      end
    end
  end
end
