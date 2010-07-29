class AddPaperclipToProjects < ActiveRecord::Migration
  def self.up
    
    add_column :projects, :document_file_name, :string
    add_column :projects, :document_file_size, :integer
    add_column :projects, :document_content_type, :string
    add_column :projects, :document_updated_at, :datetime
    
  end

  def self.down
    remove_column :projects, :document_updated_at
    remove_column :projects, :document_content_type
    remove_column :projects, :document_file_size
    remove_column :projects, :document_file_name
  end
end
