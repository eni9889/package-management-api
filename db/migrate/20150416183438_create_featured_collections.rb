class CreateFeaturedCollections < ActiveRecord::Migration
  def change
    create_table :featured_collections, id: :uuid do |t|
      t.string :name
      t.text   :description
      t.json   :settings
      t.string :image
      t.timestamps null: false
    end
  end
end
