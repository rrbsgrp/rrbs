class CreateSubcategories < ActiveRecord::Migration
  def self.up
    create_table :subcategories do |t|
      t.string :subcategory_name
      t.text :subcategory_description
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subcategories
  end
end
