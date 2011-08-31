class Group < ActiveRecord::Base

  validates_presence_of :name

  has_many :user_groups
  has_many :users, :through => :user_groups
  #has_and_belongs_to_many :users
  has_many :discussions

end
