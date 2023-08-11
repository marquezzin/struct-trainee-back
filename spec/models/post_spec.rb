require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user, id:10, name:"aaa", email:"a@gmail.com", password:"123456", is_admin:true) }
  context "Testing factory" do
    it "should be valid" do
      expect(build(:post, user_id:user.id)).to be_valid
    end
  end

  context "Validating title" do
    it "should be invalid if title nil" do
      expect(build(:post, title:nil)).to be_invalid
      expect(build(:post, title:'')).to be_invalid
    end
  end

  context "Validating content" do
    it "should be invalid if content nil" do
      expect(build(:post, content:nil)).to be_invalid
    end
  end
end
