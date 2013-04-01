require 'spec_helper'

describe Author do 
  let(:author){ Author.new(:username => "Jeff", 
                           :password => "pass")}
  
  it "has a username" do
    expect(author.username).to eq "Jeff"
  end

  it "is an author" do
    expect(author.author?).to be
  end

  describe ".find_by_id" do
    it "finds an author" do
      author.save
      expect( Author.find_by_id(author.id) ).to be_author
    end

    it "does not find a normal user" do
      user = User.create(:username => "normal_jeff")
      expect( Author.find_by_id(user.id) ).to_not be
    end
  end

  describe "#password" do
    it "is not stored in plaintext" do
      user = User.create(:username => "normal_jeff", :password => "hello")
      expect(user.password.to_s).to_not eq "hello"
    end
  end

  describe "#password_matches?" do
    it "is true when the password matches" do
      user = User.create(:username => "normal_jeff", :password => "hello")
      expect(user.password_matches?("hello")).to be
    end
  end

  
  
end