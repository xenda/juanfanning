class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title, :null=>false, :default => "Untitled"
      t.text :content
      t.string :slug
      t.string :published_at
      t.string :status, :default => "unpublished"
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
