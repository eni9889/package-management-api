class CreateFeaturedBanner < ActiveRecord::Migration
  def change
    create_table :featured_banners, id: :uuid do |t|
      t.references :target, polymorphic: true, type: :uuid, index: true
      t.string :image
    end
  end
end
