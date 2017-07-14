class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles, id: :uuid do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
