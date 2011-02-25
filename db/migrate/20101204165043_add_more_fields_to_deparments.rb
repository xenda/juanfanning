class AddMoreFieldsToDeparments < ActiveRecord::Migration
  def self.up
    add_column :departments, :sold, :boolean
    add_column :departments, :description, :string
  end

  def self.down
    remove_column :deparments, :description
    remove_column :deparments, :sold
  end
end
