class FixPackageProviderIdUniqueness < ActiveRecord::Migration
  def change
    remove_index :packages, name: :index_packages_on_provider_id
  end
end
