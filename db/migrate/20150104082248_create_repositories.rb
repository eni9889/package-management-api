class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories, id: :uuid do |t|
      t.string :name
      t.string :deb_host
      t.string :homepage
      t.timestamps null: false
    end
  end
end
