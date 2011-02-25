class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.datetime :image_updated_at
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end
