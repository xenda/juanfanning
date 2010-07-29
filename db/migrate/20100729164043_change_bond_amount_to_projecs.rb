class ChangeBondAmountToProjecs < ActiveRecord::Migration
  def self.up
    change_column :projects, :bond_amount, :decimal, :precision => 12, :scale => 2
  end

  def self.down
    change_column :projects, :bond_amount, :string
  end
end
