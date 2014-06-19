class AddSummaryToAlbums < ActiveRecord::Migration
  def up
  	add_column "albums", "summary",  :text
  end

  def down
  	remove_column "albums", "summary"
  end
end
