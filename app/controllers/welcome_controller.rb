class WelcomeController < ApplicationController

  def home
    @groups = Group.all
    @user = get_user_from_session
    if @user == nil
      @user = User.new
      @user.id = 0
    end
    respond_to do |format|
      #format.js
      format.html
    end
  end


  private
  def get_user_from_session
    user_id = session[:user_id]
    return nil if user_id == nil
    return User.find(user_id)
  end

end