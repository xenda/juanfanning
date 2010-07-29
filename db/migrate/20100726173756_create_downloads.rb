class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.integer :user_id
      t.integer :document_id
      t.datetime :enabled_at

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
