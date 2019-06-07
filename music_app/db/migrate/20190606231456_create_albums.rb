class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false
      t.integer :year, null: false
      t.boolean :studio_album, null: false, default: true
      t.timestamps
    end

    add_index :albums, [:name, :band_id], unique: true
  end
end
