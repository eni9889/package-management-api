class AddBundlesAndExecutablesIndex < ActiveRecord::Migration
  def change
    add_index :bundles, [:name], :unique => false
    add_index :executables, [:name], :unique => false
  end
end
