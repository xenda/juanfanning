class AddHeadTitleToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :head_title, :string
  end

  def self.down
    remove_column :pages, :head_title
  end
end
