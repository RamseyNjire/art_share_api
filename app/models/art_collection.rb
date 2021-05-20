class ArtCollection < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: {
        scope: :collector_id,
        message: "cannot be shared by two collections from same user"
    }

    belongs_to(
        :collector,
        class_name: "User",
        foreign_key: :collector_id,
        primary_key: :id
    )

    has_many(
        :collections,
        class_name: "Collection",
        foreign_key: :art_collection_id,
        primary_key: :id
    )

    has_many(
        :artworks,
        through: :collection,
        source: :artwork_id
    )
end
