class CreateExecutables < ActiveRecord::Migration
  def change
    create_table :executables, id: :uuid do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
