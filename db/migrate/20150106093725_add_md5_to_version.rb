class AddMd5ToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :MD5, :string
  end
end
