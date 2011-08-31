require 'test_helper'

class UserEqualTest < ActiveSupport::TestCase

  test "two different users with the same user_name are ==" do
    user1 = User.new(:name => 'user_name')
    user2 = User.new(:name => 'user_name')
    assert !user1.equal?(user2)
    assert user1==user2
  end

end
