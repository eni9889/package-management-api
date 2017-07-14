class AddSettingsToFeaturedSection < ActiveRecord::Migration
  def change
    add_column :featured_feed_sections, :settings, :json
  end
end
