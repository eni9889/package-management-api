class RefactorVersions < ActiveRecord::Migration
  def change
    rename_table  :versions, :package_versions
    rename_column :package_versions, :value, :version
    change_column :package_versions, :version, :string, null: false

    remove_index  :package_versions, column: :package_id
    add_index     :package_versions, [:package_id, :version], unique: true

    rename_column :package_versions, :MD5, :md5
    change_column :package_versions, :md5, :string, limit: 32

    change_column :package_versions, :deb, :string, null: false
    change_column :package_versions, :downloads, :integer, default: 0

    add_column    :package_versions, :raw_text, :text
    add_column    :package_versions, :meta_data, :json
  end
end
