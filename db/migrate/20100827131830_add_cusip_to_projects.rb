class AddCusipToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :cusip, :string
  end

  def self.down
    remove_column :projects, :cusip
  end
end
