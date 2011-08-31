class UsersController < ApplicationController

  # GET /users/:id
  def show
    begin
      @user = User.find(params[:id])
      respond_to do |format|
        format.js
      end
    rescue ActiveRecord::RecordNotFound
      @user = User.new
      respond_to do |format|
        format.js { render :action => 'login', :format => 'js'  }
      end
    end
  end

  # POST /users/login
  def login
    if request.post?
      @user = User.new params[:user]
      @user.mode = :login
      respond_to do |format|
        if params[:mode]=='show'|| !@user.valid?
           format.js
        else
          begin
            case @user.login
              when :wrong_user_name
                @user.errors.add :invalid_details, 'Wrong user name'
                format.js
              when :wrong_password
                @user.errors.add :invalid_details, 'Wrong password'
                format.js
              when :ok
                @user = User.find_by_name @user.name
                session[:user_id] = @user.id
                format.js { render :action => 'show', :format => 'js' }
              else
                @user.errors.add :unknown_error, 'Unknown system error, please contact webmaster'
                format.js
            end
          rescue RuntimeError => error
            @user.errors.add :system_error, error.message
            format.js
          end
        end
      end
    end
  end

  # POST /users/logout
  def logout
    @user = User.find(session[:user_id])
    session[:user_id] = nil
    session[:group_name] = nil
    respond_to do |format|
      format.js { render :action => 'login' }
    end
  end

  #POST /users/new
  def new
      @user = User.new params[:user]
      @user.mode = :new
      @user.created = Time.new
      respond_to do |format|
        if params[:mode]=='show'
          format.js
        elsif !@user.valid?
          format.js
        elsif @user.save
          session[:user_id] = @user.id
          format.js { render :action => 'show', :format => 'js' }
        else
          @user.errors.add :invalid_details, "Can't save user"
          format.js
        end
      end
  end

  def user
    @user
  end

  def user=(user)
    @user = user
  end
  

end
