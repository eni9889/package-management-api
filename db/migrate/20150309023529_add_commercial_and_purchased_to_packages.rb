class AddCommercialAndPurchasedToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :commercial, :boolean
    add_column :packages, :purchased, :boolean
  end
end
