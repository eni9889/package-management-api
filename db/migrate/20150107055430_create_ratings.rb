class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings, id: :uuid do |t|
      t.uuid :version_id
      t.uuid :user_id
      t.integer :score, default: 0
      t.timestamps null: false
    end
  end
end
