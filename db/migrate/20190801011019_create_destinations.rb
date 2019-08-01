class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :continent
      t.string :airport_code
      t.string :country
      t.string :rank

      t.timestamps
    end
  end
end
