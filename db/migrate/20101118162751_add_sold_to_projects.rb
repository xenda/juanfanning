class AddSoldToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :sold, :boolean
  end

  def self.down
    remove_column :projects, :sold
  end
end
