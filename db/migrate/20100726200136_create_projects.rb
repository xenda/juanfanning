class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :project_type, :null=>false, :default => "preliminary"
      t.string :state, :default =>"unpublished", :null=>false
      t.text :description
      t.datetime :published_at
      t.string :issuer
      t.decimal :bond_amount, :precision => 6, :scale => 2
      t.name :contact_person
      t.string :sale_type, :default =>"competitive"
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
