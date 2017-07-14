class CreateFeaturedSets < ActiveRecord::Migration
  def change
    create_table :featured_sets, id: :uuid do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
