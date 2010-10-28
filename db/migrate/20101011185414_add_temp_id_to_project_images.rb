class AddTempIdToProjectImages < ActiveRecord::Migration
  def self.up
    add_column :project_images, :temp_id, :string
  end

  def self.down
    remove_column :project_images, :temp_id
  end
end
