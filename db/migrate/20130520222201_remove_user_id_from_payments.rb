class RemoveUserIdFromPayments < ActiveRecord::Migration
	change_table :payments do |t|
		t.remove :user_id
		t.references :tenant
	end
end
