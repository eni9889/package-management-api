class AddUniqIndexToAuthors < ActiveRecord::Migration
  def change
    add_index :authors, [:name, :email, :dev_id], unique: true
  end
end
