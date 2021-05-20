class CreateArtCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :art_collections do |t|

      t.string :name, null: false
      t.text :description
      
      t.integer :collector_id, user: :references, null: false

      t.index :collector_id

      t.index [:name, :collector_id], unique: true

      t.timestamps
    end
  end
end
