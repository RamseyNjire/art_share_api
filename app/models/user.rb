# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    has_many(
        :artworks,
        class_name: 'Artwork',
        foreign_key: :artist_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :artwork_shares,
        class_name: 'ArtworkShare',
        foreign_key: :viewer_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :shared_artworks,
        through: :artwork_shares,
        source: :artwork
    )

    has_many(
        :comments,
        class_name: 'Comment',
        foreign_key: :commenter_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :likes,
        class_name: 'Like',
        foreign_key: :user_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :liked_artworks,
        through: :likes,
        source: :likeable,
        source_type: 'Artwork'
    )

    has_many(
        :liked_comments,
        through: :likes,
        source: :likeable,
        source_type: 'Comment'
    )

    has_many(
        :art_collections,
        class_name: "ArtCollection",
        foreign_key: :collector_id,
        primary_key: :id
    )
end
