class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :shop_id
      t.integer :product_id
      t.string :shopify_variant_id
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.string :sku
      t.integer :position
      t.integer :grams
	  t.string :inventory_policy
	  t.decimal :compare_at_price, :precision => 8, :scale => 2
	  t.string :fulfillment_service
      t.string :inventory_management
      t.string :option1
      t.string :option2
      t.string :option3
      t.boolean :taxable
      t.string :barcode
      t.integer :inventory_quantity
      t.decimal :weight, :precision => 8, :scale => 2
      t.string :weight_unit
      t.integer :old_inventory_quantity
      t.boolean :requires_shipping
      t.timestamps null: false
    end

    add_index :stocks, :shop_id
    add_index :stocks, :product_id
    add_index :stocks, :shopify_variant_id

  end
end
