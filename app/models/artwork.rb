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

    has_many(
        :artwork_shares,
        class_name: 'ArtworkShare',
        foreign_key: :artwork_id,
        primary_key: :id
    )

    has_many(
        :shared_viewers,
        through: :artwork_shares,
        source: :viewer
    )

    def self.artworks_for_user(user_id)
        Artwork
        .left_outer_joins(:artwork_shares)
        .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
        .distinct
    end
end
