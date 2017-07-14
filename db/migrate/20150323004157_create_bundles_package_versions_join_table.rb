class CreateBundlesPackageVersionsJoinTable < ActiveRecord::Migration
  def change
    create_table :bundles_package_versions, id: false do |t|
      t.uuid :bundle_id
      t.uuid :version_id
    end

    add_index :bundles_package_versions, :bundle_id
    add_index :bundles_package_versions, :version_id
  end
end
