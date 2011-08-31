class CreateDiscussions < ActiveRecord::Migration
  def self.up
    create_table :discussions do |t|
      t.references  :user, :null => false
      t.references  :group, :null => false
      t.string      :title
      t.string      :details
      t.datetime    :created
    end
  end

  def self.down
  end
end
