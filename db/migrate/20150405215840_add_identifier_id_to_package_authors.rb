class AddIdentifierIdToPackageAuthors < ActiveRecord::Migration
  def change
    add_column :package_authors, :identifier_id, :uuid
    add_index  :package_authors, :identifier_id
  end
end
