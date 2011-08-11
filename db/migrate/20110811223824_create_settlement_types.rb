class CreateSettlementTypes < ActiveRecord::Migration
  def self.up
    create_table :settlement_types do |t|
      t.string :st_name

      t.timestamps
    end
  end

  def self.down
    drop_table :settlement_types
  end
end
