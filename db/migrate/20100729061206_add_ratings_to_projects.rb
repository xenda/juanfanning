class AddRatingsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :ratings, :string
  end

  def self.down
    remove_column :projects, :ratings
  end
end
