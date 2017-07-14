class CreatePackageAuthors < ActiveRecord::Migration
  def change
    create_table :authors, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :dev_id
      t.timestamps null: false
    end
  end
end
