class AddHeadTitleToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :head_title, :string
  end

  def self.down
    remove_column :projects, :head_title
  end
end
