class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.bigint :artwork_id, artwork: :references, null: false
      t.bigint :art_collection_id, art_collection: :references, null: false

      t.index [:artwork_id, :art_collection_id], unique: true
      t.timestamps
    end
  end
end
