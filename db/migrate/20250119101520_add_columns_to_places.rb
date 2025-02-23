class AddColumnsToPlaces < ActiveRecord::Migration[7.1]
  def up
    add_column :places, :icon, :string
    add_column :places, :kind, :string
  end

  def down
    remove_column :places, :icon
    remove_column :places, :kind
  end
end
