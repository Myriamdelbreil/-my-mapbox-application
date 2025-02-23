class CreatePlaces < ActiveRecord::Migration[6.1]
  def up
    create_table :places do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :latitude, precision: 9, scale: 6, null: false
      t.decimal :longitude, precision: 9, scale: 6, null: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end

  def down
    drop_table :places
  end
end
