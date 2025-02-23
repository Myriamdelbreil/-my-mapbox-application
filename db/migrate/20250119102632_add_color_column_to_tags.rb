class AddColorColumnToTags < ActiveRecord::Migration[7.1]
  def up
    add_column :tags, :color, :string
  end

  def down
    remove_column :tags, :color
  end
end
