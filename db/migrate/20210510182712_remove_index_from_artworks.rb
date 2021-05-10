class RemoveIndexFromArtworks < ActiveRecord::Migration[5.2]
  def change
    remove_index :artworks, column: [:title, :artist_id]
  end
end
