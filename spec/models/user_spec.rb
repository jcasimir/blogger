require 'spec_helper'

describe User do
  describe "#to_s" do
    it "returns just the first name" do
      user = User.create(:first_name => "Jeff")
      expect(user.to_s).to eq "Jeff"
    end

    context "when there is no first name" do
      it "uses the username" do
        user = User.create(:username => "somename")
        expect(user.to_s).to eq "somename"
      end
    end
  end 

  describe "#author?" do
    it "is false" do
      user = User.create(:first_name => "Jeff")
      expect(user.author?).to_not be
    end
  end
end
