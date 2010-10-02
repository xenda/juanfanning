class AddMetatagsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :metatags, :text
  end

  def self.down
    remove_column :pages, :metatags
  end
end
