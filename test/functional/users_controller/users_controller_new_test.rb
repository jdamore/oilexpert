require 'test_helper'
require File.dirname(__FILE__) + '/users_controller_test'

class UsersControllerNewTest < UsersControllerTest

  @pass
  test "registration with blank user name shows 2 user name errors only" do
    params = user_params
    params[:name] = nil
    post :new, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length >0
    assert_equal 2, errors[:name].length
    assert_equal 0, errors[:email].length
    assert_equal 0, errors[:password].length
    assert_equal 0, errors[:password_confirmation].length
    assert_response :success
  end

  @pass
  test "registration with too short a user name shows 1 user name error only" do
    params = user_params
    params[:name] = '12'
    post :new, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length > 0
    assert_equal 1, errors[:name].length
    assert_equal 0, errors[:email].length
    assert_equal 0, errors[:password].length
    assert_equal 0, errors[:password_confirmation].length
    assert_response :success
  end

  @pass
  test "registration with blank password shows 2 password errors" do
    params = user_params
    params[:name] = params[:name.to_s] + '_new'
    params[:password] = nil
    params[:password_confirmation] = nil
    post :new, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length >0
    assert_equal 0, errors[:name].length
    assert_equal 0, errors[:email].length
    assert_equal 2, errors[:password].length
    assert_equal 1, errors[:password_confirmation].length
    assert_response :success
  end


  @pass
  test "registration with too short a password shows 1 password error only" do
    params = user_params
    params[:name] = params[:name.to_s] + '_new'
    params[:password] = '12'
    params[:password_confirmation] = '12'
    post :new, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length > 0
    assert_equal 0, errors[:name].length
    assert_equal 0, errors[:email].length
    assert_equal 1, errors[:password].length
    assert_equal 0, errors[:password_confirmation].length
    assert_response :success
  end

  @pass
  test "registration with mismatching passwords shows 1 password error only" do
    params = user_params
    params[:name] = params[:name.to_s] + '_new'
    params[:password] = 'test'
    params[:password_confirmation] = 'test_mismatch'
    post :new, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length > 0
    assert_equal 0, errors[:name].length
    assert_equal 0, errors[:email].length
    assert_equal 1, errors[:password].length
    assert_equal 0, errors[:password_confirmation].length
    assert_response :success
  end

  @pass
  test "registration with blank email shows 2 email errors" do
    params = user_params
    params[:name] = params[:name.to_s] + '_new'
    params[:password] = 'test'
    params[:password_confirmation] = 'test'
    params[:email] = nil
    post :new, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length >0
    assert_equal 0, errors[:name].length
    assert_equal 2, errors[:email].length
    assert_equal 0, errors[:password].length
    assert_equal 0, errors[:password_confirmation].length
    assert_response :success
  end

  @pass
  test "registration with invalid email shows 1 email errors" do
    params = user_params
    params[:name] = params[:name.to_s] + '_new'
    params[:password] = 'test'
    params[:password_confirmation] = 'test'
    params[:email] = 'test.com'
    post :new, :user => params, :format => :js
    errors = @controller.user.errors
    assert errors.length >0
    assert_equal 0, errors[:name].length
    assert_equal 1, errors[:email].length
    assert_equal 0, errors[:password].length
    assert_equal 0, errors[:password_confirmation].length
    assert_response :success
  end

  @pass
  test "registration with valid details shows no error" do
    params = user_params
    params[:name] = params[:name.to_s] + '_new'
    params[:password] = 'test'
    params[:password_confirmation] = 'test'
    post :new, :user => params, :format => :js
    errors = @controller.user.errors
    assert_equal 0, errors.length
    assert_equal 0, errors[:name].length
    assert_equal 0, errors[:email].length
    assert_equal 0, errors[:password].length
    assert_equal 0, errors[:password_confirmation].length
    assert_response :success
  end

  @pass
  test "registration with valid details creates new User in dB" do
    params = user_params
    params[:name] = params[:name.to_s] + '_new'
    params[:password] = 'test'
    params[:password_confirmation] = 'test'
    post :new, :user => params, :format => :js
    assert_response :success
    assert_not_nil User.find_by_name(params[:name])
  end

end
