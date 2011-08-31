require 'digest/sha1'

class User < ActiveRecord::Base


  include StringUtil

  has_many :user_groups
  has_many :groups, :through => :user_groups
  has_many :discussions

  attr_accessor :password, :password_confirmation

  validates_presence_of :name, :password, :if => 'mode==:login'
  validates_presence_of :name, :email, :password, :password_confirmation, :if => 'mode==:new'
  validates_length_of :name, :within => 3..100, :if => 'mode==:new'
  validates_length_of :password, :within => 3..40, :if => 'mode==:new'
  validates_uniqueness_of :name, :if => 'mode==:new'
  validates_confirmation_of :password, :if => 'mode==:new'
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email", :if => 'mode==:new'

  def mode
    @mode
  end

  def mode=(mode)
    @mode = mode
  end

  def new?
    self.mode==:new
  end

  @tested
  def login
    raise "Can't take nil user name" if self.name == nil
    raise "Can't take nil or empty password" if self.password == nil || self.password.length == 0
    existing_user = User.find_by_name self.name
    return :wrong_user_name if existing_user == nil
    return :wrong_password if !existing_user.password_match?(self.password)
    :ok
  end

  @tested
  def password=(password)
    @password = password
    if password != nil
      self.salt = generate_string(10) if self.salt == nil
      self.hashed_password = User.encrypt password, self.salt
    end
  end

  @tested
  def password_match? password
    raise "Can't match password when self.hashed_password is nil" if self.hashed_password == nil
    raise "Can't match password when self.salt is nil" if self.salt == nil
    return false if password == nil
    User.encrypt(password, self.salt) == self.hashed_password
  end

  @tested
  def == user
    return false if user==nil
    return false if !user.respond_to?('hashed_password')
    user.name==self.name
  end

  private
  def User.encrypt password, salt
    Digest::SHA1.hexdigest(password+salt)
  end

end






  #def confirm_password
  #  @confirm_password
  #end
  #
  #def confirm_password=(confirm_password)
  #  @confirm_password = confirm_password
  #end
  #
  #def password
  #  @password
  #end

  #def authenticated?
  #  @authenticated
  #end
  #
  #def authenticated=(authenticated)
  #  @authenticated=authenticated
  #end

