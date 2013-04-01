require 'spec_helper'

describe Author do 
  let(:author){ Author.new(:username => "Jeff", 
                           :password => "pass")}
  
  it "has a username" do
    expect(author.username).to eq "Jeff"
  end

  it "has a password" do
    expect(author.password).to eq "pass"
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
  
end