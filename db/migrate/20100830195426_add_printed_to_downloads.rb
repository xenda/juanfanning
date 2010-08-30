class AddPrintedToDownloads < ActiveRecord::Migration
  def self.up
    add_column :downloads, :printed, :boolean, :default => false
  end

  def self.down
    remove_column :downloads, :printed
  end
end
