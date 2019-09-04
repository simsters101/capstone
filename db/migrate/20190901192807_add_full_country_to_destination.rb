class AddFullCountryToDestination < ActiveRecord::Migration[6.0]
  def change
    rename_column :destinations, :country, :country_code
    add_column :destinations, :country, :string
  end
end
