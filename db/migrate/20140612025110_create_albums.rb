class CreateAlbums < ActiveRecord::Migration
  def up
    create_table :albums do |t|
      t.integer"artist_id"
    	t.string"name"
      t.string"album_artist"
    	t.integer"year"

      t.timestamps
    end
  end

    # add_index("albums", "artist_id")
    # add_index("albums", "permalink")

  def down
  	drop_table :albums
  end
end
