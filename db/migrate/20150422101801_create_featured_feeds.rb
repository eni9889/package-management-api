class CreateFeaturedFeeds < ActiveRecord::Migration
  def change
    create_table :featured_feeds, id: :uuid do |t|
      t.uuid :category_id

      t.timestamps null: false
    end
  end
end
