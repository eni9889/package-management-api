class CreatePackageDownloadCounts < ActiveRecord::Migration
  def change
    create_table :package_download_counts, id: :uuid do |t|
      t.references :target, polymorphic: true, type: :uuid, index: true
      t.datetime :created_at, null: false
      t.integer :count, null: false, default: 0
    end

    add_index :package_download_counts, :created_at
  end
end
