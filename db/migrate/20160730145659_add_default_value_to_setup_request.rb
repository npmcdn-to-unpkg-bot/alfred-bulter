class AddDefaultValueToSetupRequest < ActiveRecord::Migration
  def change
  	change_column :setup_requests, :status, :string, :default => "pending", :null => false
  end
end
