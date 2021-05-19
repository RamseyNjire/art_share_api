# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  artwork_id   :integer          not null
#  commenter_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  body         :text             not null
#
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
