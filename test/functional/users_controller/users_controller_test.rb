require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  fixtures :users

  def setup
    @controller = UsersController.new
    #@_request    = ActionController::TestRequest.new
    #@_response   = ActionController::TestResponse.new
    #@request.host = "localhost"
  end

  protected
  def user_params
    user = users(:existing)
    extra_params = Hash.new
    extra_params[:password] = 'test'
    extra_params[:password_confirmation] = 'test'
    params = user.attributes.merge(extra_params)
    params
  end

end
