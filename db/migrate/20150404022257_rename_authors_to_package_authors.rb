class RenameAuthorsToPackageAuthors < ActiveRecord::Migration
  def change
    rename_table :authors, :package_authors
  end
end
