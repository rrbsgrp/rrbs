class CreateSsrows < ActiveRecord::Migration
  def self.up
    create_table :ssrows do |t|
      t.integer :st_id
      t.float :ss_amount

      t.timestamps
    end
  end

  def self.down
    drop_table :ssrows
  end
end
