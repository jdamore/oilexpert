class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :name
      t.string   :email
      t.string   :hashed_password
      t.string   :salt
      t.datetime :created
    end
  end

  def self.down
    drop_table :users
  end
end
