class AddBannerToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :banner_file_name, :string
    add_column :projects, :banner_content_type, :string
    add_column :projects, :banner_file_size, :integer
    add_column :projects, :banner_updated_at, :datetime
  end

  def self.down
    remove_column :projects, :banner_updated_at
    remove_column :projects, :banner_file_size
    remove_column :projects, :banner_content_type
    remove_column :projects, :banner_file_name
  end
end
