class CreateExecutablesPackageVersionsJoinTable < ActiveRecord::Migration
  def change
    create_table :executables_package_versions, id: false do |t|
      t.uuid :executable_id
      t.uuid :version_id
    end

    add_index :executables_package_versions, :executable_id
    add_index :executables_package_versions, :version_id
  end
end
