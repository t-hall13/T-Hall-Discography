class CreateSongs < ActiveRecord::Migration
  def up
    create_table :songs do |t|
    	t.integer"album_id"
    	t.string"name"
    	t.string"permalink"
    	t.integer"position"
      t.string"writer"
      t.text"summary"

      t.timestamps
    end
    add_index("songs", "album_id")
    add_index("songs", "permalink")


  end
  def down
  	drop_table :songs
  end
end
