class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true
    validates :title, uniqueness: {
        scope: :artist_id,
        message: "cannot be same for two artworks by same artist"
    }

    belongs_to(
        :artist,
        class_name: 'User',
        foreign_key: :artist_id,
        primary_key: :id
    )
end
