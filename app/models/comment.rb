class Comment < ApplicationRecord
    validates :artwork_id, :commenter_id, :body, presence: true

    belongs_to(
        :artwork,
        class_name: 'Artwork',
        foreign_key: :artwork_id,
        primary_key: :id
    )

    belongs_to(
        :commenter,
        class_name: 'User',
        foreign_key: :commenter_id,
        primary_key: :id
    )

    has_many :likes, as: :likeable, dependent: :destroy

    has_many(
        :likers,
        through: :likes,
        source: :user
    )
end
