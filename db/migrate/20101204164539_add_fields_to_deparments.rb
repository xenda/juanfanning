class AddFieldsToDeparments < ActiveRecord::Migration
  def self.up
    add_column :departments, :meter_price, :string
    add_column :departments, :total_price, :string
  end

  def self.down
    remove_column :deparments, :total_price
    remove_column :deparments, :meter_price
  end
end
