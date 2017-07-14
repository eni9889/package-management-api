class AddSomeConstraintsToPackages < ActiveRecord::Migration
  def change
    remove_column :packages, :author_id,     :string
    add_column    :packages, :author_id,     :uuid, null: false

    remove_column :packages, :description, :string
    add_column    :packages, :description, :text

    remove_column :packages, :price, :string
    add_column    :packages, :price, :decimal, precision: 5, scale: 2

    add_column    :packages, :extra_info, :json
    add_index     :packages, :provider_id, unique: true
  end
end
