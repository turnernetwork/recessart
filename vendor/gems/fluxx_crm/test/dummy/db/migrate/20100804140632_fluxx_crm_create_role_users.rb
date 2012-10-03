class FluxxCrmCreateRoleUsers < ActiveRecord::Migration
  def self.up
    create_table :role_users do |t|
      t.timestamps
      t.integer :created_by_id, :updated_by_id, :null => true, :limit => 12
      t.string :name, :null => true
      t.integer :user_id, :null => true, :limit => 12
      t.string :roleable_type, :null => true
      t.integer :roleable_id, :null => true, :limit => 12
    end
    add_index :role_users, [:name, :roleable_type, :roleable_id]
    add_index :role_users, [:user_id, :roleable_type]
    add_index :role_users, [:roleable_id]
    add_index :role_users, :user_id
    add_constraint 'role_users', 'role_users_created_by_id', 'created_by_id', 'users', 'id'
    add_constraint 'role_users', 'role_users_updated_by_id', 'updated_by_id', 'users', 'id'
    add_constraint 'role_users', 'role_users_user_id', 'user_id', 'users', 'id'
  end

  def self.down
    drop_table :role_users
  end
end
