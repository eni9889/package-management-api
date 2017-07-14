class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages, id: :uuid do |t|
      t.string    :name
      t.string    :description
      t.string    :author_id
      t.integer   :downloads
      t.string    :provider_id
      t.timestamps null: false
    end
  end
end