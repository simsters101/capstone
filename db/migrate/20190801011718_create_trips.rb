class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :destination_id1
      t.string :destination_id2
      t.integer :price

      t.timestamps
    end
  end
end
