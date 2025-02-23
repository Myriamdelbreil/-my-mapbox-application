class AddAddressColumnToPlaces < ActiveRecord::Migration[7.1]
  def up
    add_column :places, :address, :string
  end

  def down
    remove_column :places, :adddress
  end
end
