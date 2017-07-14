class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, id: :uuid do |t|
      t.string :text
      t.uuid :rating_id
      t.timestamps null: false
    end
  end
end
