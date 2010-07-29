class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :company, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :phone, :string
  end

  def self.down
    remove_column :users, :phone
    remove_column :users, :zip
    remove_column :users, :state
    remove_column :users, :city
    remove_column :users, :address2
    remove_column :users, :address1
    remove_column :users, :company
  end
end
