class AddLandlordIdToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :landlord_id, :integer
  end
end
