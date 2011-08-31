require 'test_helper'

class UserPasswordTest < ActiveSupport::TestCase

  fixtures :users

  @pass
  test 'do not raise error password if given password is nil' do
    user = User.new
    assert_nothing_raised do
      user.password = nil
    end
  end

  @pass
  test 'do not encrypt password if given password is nil' do
    user = User.new
    user.password = nil
    assert_nil user.hashed_password
  end

  @pass
  test 'encrypt password if given password is not nil' do
    user = User.new
    user.password = 'test'
    assert_not_nil user.hashed_password
  end

  @pass
  test 'encrypt password as expected when salt is set' do
    user = User.new
    user.salt = users(:existing).salt
    user.password = 'test'
    assert_equal users(:existing).hashed_password, user.hashed_password
  end

end
