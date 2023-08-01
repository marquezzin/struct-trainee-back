require 'rails_helper'

RSpec.describe User, type: :model do
  context "Testing factory" do
    it { expect(build(:user)).to be_valid }
    it { expect(build(:user, :admin)).to be_valid }
  end

  context "Validanting name" do
    it "should be invalid if nil" do
      expect(build(:user, name: nil)).to be_invalid
    end
    it "should be invalid if empty" do
      expect(build(:user, name: "")).to be_invalid
    end
    it "should be invalid if repeated" do
      create(:user, name: "Usuarioo", email: "usuarioo@gmail.com")
      expect(build(:user, name: "Usuarioo", email: "usuarioo@gmail.com")).to be_invalid
    end
    it "should be invalid if less than 3 characters" do
      expect(build(:user, name: "ab")).to be_invalid
    end
    it "should be invalid if more than 30 characters" do
      expect(build(:user, name: "a" * 31)).to be_invalid
    end
    it "should be valid if between 3 and 30 characters" do
      expect(build(:user, name: "a" * 4)).to be_valid
    end
  end

  context "Validanting email" do
    it "should be invalid if nil" do
      expect(build(:user, email: nil)).to be_invalid
    end
    it "should be invalid if empty" do
      expect(build(:user, email: "")).to be_invalid
    end
    it "should be invalid if repeated" do
      create(:user, email: "email@example.com")
      expect(build(:user, email: "email@example.com")).to be_invalid
    end
  end

  context "Validating is_admin" do
    it "should be invalid if nil" do
      expect(build(:user, is_admin: nil)).to be_invalid
    end
    it "should be valid if false" do
      expect(build(:user, is_admin: false)).to be_valid
    end
  end 
end
