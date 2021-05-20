class Collection < ApplicationRecord
    validates :artwork_id, uniqueness: {
        scope: :art_collection_id,
        message: "cannot be added more than once to a collection"
    }

    belongs_to(
        :artwork,
        class_name: "Artwork",
        foreign_key: :artwork_id,
        primary_key: :id
    )

    belongs_to(
        :art_collection,
        class_name: "ArtCollection",
        foreign_key: :art_collection_id,
        primary_key: :id
    )
end
