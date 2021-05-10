class AddUniqueIndexToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_index :artworks, [:title, :artist_id], unique: true
  end
end
