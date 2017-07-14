class CreateFeaturedSetItems < ActiveRecord::Migration
  def change
    create_table :featured_set_items, id: :uuid do |t|
      t.uuid :set_id, null: false
      t.uuid :package_id, null: false
      t.integer :position
      t.timestamps null: false
    end
    add_index :featured_set_items, [:set_id, :position]
    add_index :featured_set_items, :package_id
  end
end
