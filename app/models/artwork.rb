# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean          default(FALSE)
#
class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true
    validates :title, uniqueness: {
        scope: :artist_id,
        message: "cannot be same for two artworks by same artist"
    }
    validates :favorite, inclusion: { in: [true, false] }

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
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :shared_viewers,
        through: :artwork_shares,
        source: :viewer
    )

    has_many(
        :comments,
        class_name: 'Comment',
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many :likes, as: :likeable, dependent: :destroy

    has_many(
        :likers,
        through: :likes,
        source: :user
    )

    has_many(
        :collections,
        class_name: "Collection",
        foreign_key: :artwork_id,
        primary_key: :id
    )

    has_many(
        :art_collections,
        through: :collections,
        source: :art_collection_id
    )

    def self.artworks_for_user(user_id)
        Artwork
        .left_outer_joins(:artwork_shares)
        .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
        .distinct
    end
end
