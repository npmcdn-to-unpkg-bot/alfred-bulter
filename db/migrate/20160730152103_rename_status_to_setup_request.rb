class RenameStatusToSetupRequest < ActiveRecord::Migration
  def change
  	rename_column :setup_requests, :status, :state
  end
end
