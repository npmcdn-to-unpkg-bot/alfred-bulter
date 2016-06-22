class AddAvatarColumnsToShops < ActiveRecord::Migration
  def change
  	add_attachment :shops, :avatar
  end
end
