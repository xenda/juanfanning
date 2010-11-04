class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :size
      t.string :bathroom_number
      t.string :garages_number
      t.string :rooms_number
      t.integer :project_id
      t.timestamps
    end
  end

  def self.down
    drop_table :departments
  end
end
