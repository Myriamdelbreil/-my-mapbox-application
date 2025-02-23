class AddCreatedByColumnToTags < ActiveRecord::Migration[7.1]
  def up
    add_reference :tags, :user, null: false, foreign_key: true
  end

  def down
    remove_reference :tags, :user, null: false, foreign_key: true
  end
end
