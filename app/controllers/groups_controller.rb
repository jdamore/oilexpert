class GroupsController < ApplicationController

  def index
    @groups = Group.all
    respond_to do |format|
      format.js
      format.html { render :partial => 'groups/index' }
    end
  end

end
