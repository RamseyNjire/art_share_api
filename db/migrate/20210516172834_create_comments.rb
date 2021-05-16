class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :artwork_id, artwork: :references
      t.integer :commenter_id, user: :references

      t.index :artwork_id
      t.index :commenter_id

      t.timestamps
    end
  end
end
