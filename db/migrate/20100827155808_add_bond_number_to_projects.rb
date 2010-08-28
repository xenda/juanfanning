class AddBondNumberToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :bond_number, :string
  end

  def self.down
    remove_column :projects, :bond_number
  end
end
