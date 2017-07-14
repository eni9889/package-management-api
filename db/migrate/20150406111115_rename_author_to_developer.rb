class RenameAuthorToDeveloper < ActiveRecord::Migration
  def change
    rename_table  :authors, :developers
    rename_table  :author_identifiers, :developer_identifiers
    rename_column :developer_identifiers, :author_id, :developer_id
    rename_column :packages, :author_id, :developer_id
  end
end
