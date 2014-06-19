class AddIndexesToAlbums < ActiveRecord::Migration
 #  def up
 #  	add_column"albums", "artist_id", :integer
 #  end

  add_index("albums", "artist_id")
  add_index("albums", "permalink")

  def down
  	#drop_column"albums", "artist_id"
  end

end

