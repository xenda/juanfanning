class AddUnderwritersToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :underwriters, :string
  end

  def self.down
    remove_column :projects, :underwriters
  end
end
