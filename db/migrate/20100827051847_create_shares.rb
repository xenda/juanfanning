class CreateShares < ActiveRecord::Migration
  def self.up
    create_table :shares do |t|
      t.string :from
      t.string :from_email
      t.string :to_email
      t.string :subject
      t.content :message

      t.timestamps
    end
  end

  def self.down
    drop_table :shares
  end
end
