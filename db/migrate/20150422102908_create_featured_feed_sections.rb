class CreateFeaturedFeedSections < ActiveRecord::Migration
  def change
    create_table :featured_feed_sections, id: :uuid do |t|
      t.uuid    :feed_id, null: false
      t.integer :position
      t.string  :name
      t.string  :section_type
      t.references :target, polymorphic: true, type: :uuid, index: true
      t.timestamps null: false

      t.index :feed_id
    end
  end
end
