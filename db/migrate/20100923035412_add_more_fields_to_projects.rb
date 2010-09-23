class AddMoreFieldsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :sale_date, :date
  end

  def self.down
    remove_column :projects, :sale_date
  end
end
