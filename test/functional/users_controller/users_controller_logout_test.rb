require 'test_helper'
require File.dirname(__FILE__) + '/users_controller_test'

class UsersControllerLogoutTest < UsersControllerTest

  @pass
  test "logout removes user from session" do
    session[:user_id] = User.find_by_name(users(:existing).name).id
    post :logout, :format => :js
    assert_nil session[:user_id]
  end

end
