class AddInterestToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :interest, :string, :default => "all"
  end

  def self.down
    remove_column :users, :interest
  end
end
