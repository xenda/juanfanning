class ChangeColumnsToProjects < ActiveRecord::Migration
  def self.up
    change_column :projects, :state, :string, :default => false
    change_column :projects, :status, :string, :default => "unpublished"
  end

  def self.down
    change_column :projects, :status, :string
    change_column :projects, :state, :string
  end
end
