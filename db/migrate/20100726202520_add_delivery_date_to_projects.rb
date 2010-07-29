class AddDeliveryDateToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :delivery_date, :datetime
  end

  def self.down
    remove_column :projects, :delivery_date
  end
end
