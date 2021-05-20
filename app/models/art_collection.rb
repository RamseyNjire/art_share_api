# == Schema Information
#
# Table name: art_collections
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  description  :text
#  collector_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
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
        through: :collections,
        source: :artwork
    )

    def self.art_collections_for_artwork(artwork_id)
        ArtCollection.joins
    end
end
