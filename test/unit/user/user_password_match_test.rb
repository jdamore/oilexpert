require 'test_helper'

class UserPasswordMatchTest < ActiveSupport::TestCase

  fixtures :users

  @pass
  test "raises RuntimeError when self hashed_password is nil" do
    user = users(:existing)
    user.hashed_password = nil
    assert_raise RuntimeError do
      user.password_match? 'test'
    end
  end

  @pass
  test "raises RuntimeError when self salt is nil" do
    user = users(:existing)
    user.salt = nil
    assert_raise RuntimeError do
      user.password_match? 'test'
    end
  end

  @pass
  test "do not raise RuntimeError when given password is nil" do
    user = users(:existing)
    assert_nothing_raised do
      user.password_match? nil
    end
  end

  @pass
  test "returns false when given password is nil" do
    user = users(:existing)
    assert_equal false, user.password_match?(nil)
  end

end
