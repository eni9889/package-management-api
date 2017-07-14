class AddPriceToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :price, :string
  end
end
