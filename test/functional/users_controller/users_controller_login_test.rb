require 'test_helper'
require File.dirname(__FILE__) + '/users_controller_test'

class UsersControllerLoginTest < UsersControllerTest

  @pass
  test "login with blank user name shows 1 user name error only" do
    params = user_params
    params[:name] = nil
    post :login, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length >0
    assert_equal 1, errors[:name].length
    assert_equal 0, errors[:password].length
    assert_response :success
  end

  @pass
  test "login with blank password shows 1 password error only" do
    params = user_params
    params[:password] = nil
    post :login, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length >0
    assert_equal 0, errors[:name].length
    assert_equal 1, errors[:password].length
    assert_response :success
  end

  @pass
  test "login with valid details shows no error" do
    params = user_params
    post :login, :user => params, :format => :js
    errors = @controller.user.errors
    assert_equal 0, errors.length
    assert_equal 0, errors[:name].length
    assert_equal 0, errors[:password].length
    assert_response :success
  end

  @pass
  test "login with valid details add user_id to session" do
    params = user_params
    assert_nil session[:user_id]
    post :login, :user => params, :format => :js
    assert_response :success
    assert_not_nil session[:user_id]
    assert_equal @controller.user.id, session[:user_id]
  end

end
