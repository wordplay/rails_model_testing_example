require 'spec_helper'

describe User do

# Test that we can add a valid user
  it "should create a user with valid info" do
    FactoryGirl.create(:user).should be_valid
  end

# Tests for username validation
  it "should not save without username" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end

  it "should not create a duplicate user" do
    FactoryGirl.create(:user, username: "Adam")
    FactoryGirl.build(:user, username: "Adam").should_not be_valid
    FactoryGirl.build(:user, username: "adam").should_not be_valid
  end

  it "should not have a too short username" do
    FactoryGirl.build(:user, username: "x").should_not be_valid
  end

  it "should not have a too long username" do
    FactoryGirl.build(:user, username: "12345678901234567890").should_not be_valid
  end

# Tests for password validation
  it "should not save without password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end

  it "should have a robust password" do
    FactoryGirl.build(:user, password: "PASSWORD1").should_not be_valid
    FactoryGirl.build(:user, password: "password1").should_not be_valid
    FactoryGirl.build(:user, password: "Password").should_not be_valid
  end
end
