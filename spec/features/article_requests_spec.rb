require 'spec_helper'

describe "Article Requests" do
  describe "/" do
    it "shows the title" do
      visit "/"
      expect(page).to have_content("ZOMG IT'S A BLOG!")
    end
  end
end
