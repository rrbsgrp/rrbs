class CreatePurchaseItems < ActiveRecord::Migration
  def self.up
    create_table :purchase_items do |t|
      t.float :purchase_unitCost
      t.float :vat_amount
      t.float :net_amount
      t.float :purchase_quantity
      t.string :purchase_remarks
      t.string :purchase_item
      t.integer :invoice_id
      t.integer :inventory_id
      t.string :vat_type
      t.integer :unit_id

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_items
  end
end
