class AddRatingsIndex < ActiveRecord::Migration
  def change
    add_index :ratings, [:version_id, :user_id], :unique => true
  end
end
