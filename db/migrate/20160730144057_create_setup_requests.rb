class CreateSetupRequests < ActiveRecord::Migration
  def change
    create_table :setup_requests do |t|
      t.string :name
      t.integer :shop_id
      t.string :source_type
      t.string :file_format
      t.string :status
      t.timestamps null: false
    end
  end
end
