class CreateCategorysales < ActiveRecord::Migration
  def self.up
    create_table :categorysales do |t|
      t.float :cs_amount
      t.integer :category_id
      t.integer :employee_id
      t.float :vat
      t.float :void
      t.float :servicecharge
      t.float :cs_revenue

      t.timestamps
    end
  end

  def self.down
    drop_table :categorysales
  end
end
