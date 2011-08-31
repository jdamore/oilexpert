class CreateUserGroups < ActiveRecord::Migration

  def self.up
    create_table :user_groups, :id => false do |t|
      t.references :user, :null => false
      t.references :group, :null => false
    end
    add_index(:user_groups, [:user_id, :group_id], :unique => true)
  end

  def self.down
    remove_index :user_groups
    drop_table :user_groups
  end
end
