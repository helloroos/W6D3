class ChangeIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
    
    remove_index :artworks, [:artist_id, :title]
    add_index :artworks, [:title, :artist_id], unique: true
  end
end
