class ChangeCollectionItemPackageIdToSetId < ActiveRecord::Migration
  def change
    rename_column :featured_collection_items, :package_id, :set_id
    add_index :featured_collection_items, :set_id
    add_index :featured_collection_items, [:collection_id, :position]
  end
end
