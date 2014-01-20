require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

# Test that we can add a valid user
  test "should create a user with valid info" do
    user = User.new(username: "User01", password: "Password1")
    assert user.save, "Could not save a user with valid name and password"
  end

# Tests for username validation

  test "should not save without username" do
    user = User.new(password: "Password1")
    assert_not user.save, "Saved the user without a username"
  end

  test "should not create a duplicate user" do
    user = User.new(username: "Adam", password: "Password1")
    assert_not user.save, "Saved a user with the exact same username as an existing user"

    user = User.new(username: "adam", password: "Password1")
    assert_not user.save, "Saved a user with a lowercase version of username of existing user"    
  end

  test "should not have a too short username" do
    user = User.new(username: "x", password: "Password1")
    assert_not user.save, "Saved a user with a username that is too short"
  end

  test "should not have a too long username" do
    user = User.new(username: "12345678901234567890", password: "Password1")
    assert_not user.save, "Saved a user with a username that is too short"
  end

# Tests for password validation

  test "should not save without password" do
    user = User.new(username: "User01")
    assert_not user.save, "Saved the user without a password"
  end

  test "password should be robust" do
    user = User.new(username: "User01")
    user.password = "PASSWORD1"
    assert_not user.save, "Saved the user with a password with no lowercase letter"

    user.password = "password1"
    assert_not user.save, "Saved the user with a password with no uppercase letter"

    user.password = "Password"
    assert_not user.save, "Saved the user with a password with no numbers"
  end
end
