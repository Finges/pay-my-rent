class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user
      t.float :amount
      t.float :amount_due

      t.timestamps
    end
    add_index :payments, :user_id
  end
end
