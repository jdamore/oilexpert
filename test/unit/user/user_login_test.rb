require 'test_helper'

class UserLoginTest < ActiveSupport::TestCase

  fixtures :users

  @pass
  test "raises RuntimeError if user_name is nil" do
    user = User.new(:name => nil)
    assert_raise RuntimeError do
      user.login
    end
  end

  @pass
  test "raises RuntimeError if password is nil" do
    user = User.new(:name => 'login', :password => nil)
    assert_raise RuntimeError do
      user.login
    end
  end

  @pass
  test "raises RuntimeError if password is empty" do
    user = User.new(:name => 'login', :password => '')
    assert_raise RuntimeError do
      user.login
    end
  end

  @pass
  test "returns :wrong_user_name if user_name not found" do
    user = User.new(:name => 'invalid_user', :password => 'does_not_matter')
    assert_equal :wrong_user_name, user.login
  end

  @pass
  test "returns :wrong_password if password does not match" do
    user = User.new(:name => users(:existing).name, :password => 'does_not_match')
    assert_equal :wrong_password, user.login
  end

  @pass
  test "returns :ok if password does matches" do
    user = User.new(:name => users(:existing).name, :password => 'test')
    assert_equal :ok, user.login
  end

end
