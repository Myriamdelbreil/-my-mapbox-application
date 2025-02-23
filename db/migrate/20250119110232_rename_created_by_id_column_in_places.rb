class RenameCreatedByIdColumnInPlaces < ActiveRecord::Migration[7.1]
  def change
    rename_column :places, :created_by_id, :user_id
  end
end
