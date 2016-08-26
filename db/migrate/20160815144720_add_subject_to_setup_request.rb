class AddSubjectToSetupRequest < ActiveRecord::Migration
  def change
  	add_column :setup_requests, :subject, :string
  end
end
