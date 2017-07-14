class AddDownloadsAndUploadDateIndexToPackages < ActiveRecord::Migration
  def change
    add_index :versions, :package_id
    add_index :packages, :author_id
    add_index :packages, :downloads
  end
end
