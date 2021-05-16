class AddPresenceConstraintsToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :artwork_id, :integer, null: false
    change_column :comments, :commenter_id, :integer, null: false
    change_column :comments, :body, :text, null: false
  end
end
