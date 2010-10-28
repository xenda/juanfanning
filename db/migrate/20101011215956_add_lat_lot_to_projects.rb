class AddLatLotToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :lat, :string
    add_column :projects, :long, :string
  end

  def self.down
    remove_column :projects, :long
    remove_column :projects, :lat
  end
end
