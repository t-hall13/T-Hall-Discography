class AddPermalinkToAlbums < ActiveRecord::Migration
  def up
  	add_column "albums", "permalink", :string
  end

  def down
  	remove_column "albums", "permalink"
  end
end
