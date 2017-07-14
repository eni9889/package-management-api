class CreateFeaturedCollectionItems < ActiveRecord::Migration
  def change
    create_table :featured_collection_items, id: :uuid do |t|
      t.integer :position
      t.uuid :collection_id
      t.uuid :package_id
      t.timestamps null: false
    end
  end
end
