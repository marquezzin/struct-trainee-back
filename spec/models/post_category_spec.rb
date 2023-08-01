require 'rails_helper'

RSpec.describe PostCategory, type: :model do
  let(:user) { create(:user, id:10, name:"aaa", email:"a@gmail.com", password:"123456", is_admin:true) }
  let(:category) { create(:category) }
  let(:post) { create(:post, user_id:user.id) }

  context "Testing factory" do
    it "should be valid" do
      expect(build(:post_category, post_id: post.id, category_id:category.id)).to be_valid
    end
  end

  context "Validating category" do
    it "should be invalid if nil" do
      expect(build(:post_category, category: nil)).to be_invalid
    end
    
    it "should be invalid if id does not exists" do
      expect(build(:post_category, category_id: -1)).to be_invalid
    end
  end
  
  context "Validating post" do
    it "should be invalid if nil" do
      expect(build(:post_category, post_id: nil)).to be_invalid
    end
    
    it "should be invalid if id does not exists" do
      expect(build(:post_category, post_id: -1)).to be_invalid
    end
  end
end
