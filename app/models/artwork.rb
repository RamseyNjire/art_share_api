class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness: {
        scope: :artist_id,
        message: "artist cannot have two artworks with same title"
    }
end
