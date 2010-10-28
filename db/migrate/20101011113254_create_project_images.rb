class CreateProjectImages < ActiveRecord::Migration
  def self.up
    create_table :project_images do |t|
      t.integer :project_id
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :project_images
  end
end
