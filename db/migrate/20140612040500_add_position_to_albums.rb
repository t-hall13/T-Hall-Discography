class AddPositionToAlbums < ActiveRecord::Migration
  def up
  	add_column "albums", "position", :integer
  end

  def down
  	remove_column "albums", "position"
  end
end
