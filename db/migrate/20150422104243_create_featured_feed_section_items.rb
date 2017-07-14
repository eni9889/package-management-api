class CreateFeaturedFeedSectionItems < ActiveRecord::Migration
  def change
    create_table :featured_feed_section_items, id: :uuid do |t|
      t.uuid :section_id, null: false
      t.references :target, polymorphic: true, type: :uuid, index: true
      t.integer :position

      t.timestamps null: false
      t.index :section_id
    end
  end
end
