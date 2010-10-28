class BuildingDetails < ActiveRecord::Migration
  def self.up
    add_column :projects, :name, :string, :default => "Proyecto"
    add_column :projects, :code, :string
    add_column :projects, :sales_price, :decimal, :precision => 8, :scale => 2, :default => 0
    add_column :projects, :property_type, :string, :default => "departamento"
    add_column :projects, :terrain_area, :integer, :default => 0
    add_column :projects, :constructed_area, :integer, :default => 0
    add_column :projects, :rooms, :integer, :default => 0
    add_column :projects, :bathrooms, :integer, :default => 0
    add_column :projects, :garages, :integer, :default => 0
    add_column :projects, :construction_year, :date
    add_column :projects, :floors_per_building, :integer, :default => 0
    add_column :projects, :with_furniture, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :name
  end
end
