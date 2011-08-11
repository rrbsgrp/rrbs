class CreateSettlementSales < ActiveRecord::Migration
  def self.up
    create_table :settlement_sales do |t|
      t.float :ss_amount
      t.integer :st_id
      t.integer :stemployee_id
      t.float :vat
      t.float :void
      t.date :ss_date
      t.float :ss_revenue
      t.integer :customerCount
      t.integer :transactionCount

      t.timestamps
    end
  end

  def self.down
    drop_table :settlement_sales
  end
end
