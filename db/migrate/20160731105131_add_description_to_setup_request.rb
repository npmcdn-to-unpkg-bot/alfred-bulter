class AddDescriptionToSetupRequest < ActiveRecord::Migration
  def change
  	add_column :setup_requests, :description, :text

  end
end
