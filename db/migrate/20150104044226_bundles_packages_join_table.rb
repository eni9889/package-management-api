class BundlesPackagesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :bundles, :packages do |t|
      t.uuid :bundle_id,  null: false
      t.uuid :package_id, null: false

      t.index [:bundle_id, :package_id]
      t.index [:package_id, :bundle_id]
    end
  end
end
