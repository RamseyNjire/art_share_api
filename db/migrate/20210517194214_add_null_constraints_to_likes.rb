class AddNullConstraintsToLikes < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :user_id, :bigint, null: false
    change_column :likes, :likeable_type, :string, null: false
    change_column :likes, :likeable_id, :bigint, null: false
  end
end
