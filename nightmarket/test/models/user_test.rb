require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without provider" do
    user = User.new

    user.uid = "abc"
    user.name = "Bobby McBobberson"
    user.email = "bob@bob.lawblog"
    user.oauth_token = "abc123"
    user.oauth_expires_at = Time.new(2016)

    assert !user.save, "Saved the user without a provider"
  end

  test "should not save user without name" do
    user = User.new
    user.provider = "Google"
    user.uid = "abc"
    user.email = "bob@bob.lawblog"
    user.oauth_token = "abc123"
    user.oauth_expires_at = Time.new(2016)

    assert !user.save, "Saved the user without a name"
  end

  test "should not save user without uid" do
    user = User.new
    user.provider = "Google"
    user.name = "Bobby McBobberson"
    user.email = "bob@bob.lawblog"
    user.oauth_token = "abc123"
    user.oauth_expires_at = Time.new(2016)

    assert !user.save, "Saved the user without a uid"
  end

  test "should not save user without email" do
    user = User.new
    user.provider = "Google"
    user.name = "Bobby McBobberson"
    user.uid = "abc"
    user.oauth_token = "abc123"
    user.oauth_expires_at = Time.new(2016)

    assert !user.save, "Saved the user without a email"
  end

  test "should not save user without oauth token" do
    user = User.new
    user.provider = "Google"
    user.name = "Bobby McBobberson"
    user.uid = "abc"
    user.email = "milktea@milktea.io"
    user.oauth_expires_at = Time.new(2016)

    assert !user.save, "Saved the user without a oauth token"
  end

  test "should not save user without oauth expiry" do
    user = User.new
    user.provider = "Google"
    user.name = "Bobby McBobberson"
    user.uid = "abc"
    user.email = "milktea@milktea.io"
    user.oauth_token = "abc123"

    assert !user.save, "Saved the user without a oauth expiry"
  end
end
