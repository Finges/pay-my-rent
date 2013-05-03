class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :building
      t.string :unit_num
      t.float :rent

      t.timestamps
    end
    add_index :units, :building_id
  end
end
