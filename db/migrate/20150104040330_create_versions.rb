class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions, id: :uuid do |t|
      t.string    :value
      t.string    :deb
      t.integer   :downloads
      t.uuid      :package_id
      t.datetime  :date_uploaded
      t.timestamps null: false
    end
  end
end
