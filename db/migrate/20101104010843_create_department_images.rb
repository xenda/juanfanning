class CreateDepartmentImages < ActiveRecord::Migration
  def self.up
    create_table :department_images do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :department_id
      t.string :temp_id

      t.timestamps
    end
  end

  def self.down
    drop_table :department_images
  end
end
