class DiscussionsController < ApplicationController

  #respond_to :html, :xml, :js

  def show
    if params[:my_discussions]
      render :action => 'user', :format => 'js'
    elsif  params[:group_discussions]
      render :action => 'group', :format => 'js'
    else
      render :action => 'index', :format => 'js'
    end
  end

  #def index
  #  respond_to do |format|
  #    format.js
  #  end
  #end
  #
  #def group
  #  respond_to do |format|
  #    format.js
  #  end
  #end
  #
  #def user
  #  @user = User.find_by_name(session[:user_name])
  #  respond_to do |format|
  #    format.js
  #  end
  #end

end
