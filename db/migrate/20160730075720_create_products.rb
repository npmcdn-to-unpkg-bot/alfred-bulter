class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :shop_id
      t.string :shopify_product_id
      t.string :title
      t.text :body_html
      t.string :vendor
      t.string :product_type
      t.string :handle
      t.string :template_suffix
      t.string :published_scope
      t.string :tags
      t.text :options
      t.timestamps null: false
    end

    add_index :products, :shopify_product_id
    add_index :products, :shop_id

  end
end
