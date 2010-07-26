class AddIndexesToPages < ActiveRecord::Migration
  def self.up
      add_index :pages, :user_id
  end

  def self.down
  end
end
