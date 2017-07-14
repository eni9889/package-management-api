class AddJsonIndexForPackageVersions < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE INDEX package_versions_download_state_index ON package_versions ((meta_data->>'download_state'))
    SQL
  end
end
