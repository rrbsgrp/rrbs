class CreateBranches < ActiveRecord::Migration
  def self.up
    create_table :branches do |t|
      t.text :branch_location
      t.integer :user_id
      t.string :branch_contactNumber

      t.timestamps
    end
  end

  def self.down
    drop_table :branches
  end
end
