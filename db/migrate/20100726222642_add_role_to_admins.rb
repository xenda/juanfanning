class AddRoleToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :role, :string, :default => "supervisor"
  end

  def self.down
    remove_column :admins, :role
  end
end
