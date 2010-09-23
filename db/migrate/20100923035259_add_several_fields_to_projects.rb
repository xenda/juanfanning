class AddSeveralFieldsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :contact_name, :string
    add_column :projects, :contact_company, :string
    add_column :projects, :contact_address, :string
    add_column :projects, :contact_city, :string
    add_column :projects, :contact_state, :string
    add_column :projects, :contact_zip, :string
    add_column :projects, :contact_phone, :string
    add_column :projects, :contact_email, :string
    add_column :projects, :billing_name, :string
    add_column :projects, :billing_company, :string
    add_column :projects, :billing_address, :string
    add_column :projects, :billing_city, :string
    add_column :projects, :billing_state, :string
    add_column :projects, :billing_zip, :string
    add_column :projects, :billing_phone, :string
    add_column :projects, :billing_email, :string
  end

  def self.down
    remove_column :projects, :billing_email
    remove_column :projects, :billing_phone
    remove_column :projects, :billing_zip
    remove_column :projects, :billing_state
    remove_column :projects, :billing_city
    remove_column :projects, :billing_address
    remove_column :projects, :billing_company
    remove_column :projects, :billing_name
    remove_column :projects, :contact_email
    remove_column :projects, :contact_phone
    remove_column :projects, :contact_zip
    remove_column :projects, :contact_state
    remove_column :projects, :contact_city
    remove_column :projects, :contact_address
    remove_column :projects, :contact_company
    remove_column :projects, :contact_name
  end
end
