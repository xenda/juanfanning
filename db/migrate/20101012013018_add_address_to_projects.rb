class AddAddressToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :address, :string
  end

  def self.down
    remove_column :projects, :address
  end
end
