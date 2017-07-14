class CreateAuthorIdentifiers < ActiveRecord::Migration
  def change
    create_table :author_identifiers, id: :uuid do |t|
      t.uuid   :author_id
      t.string :identifier
      t.string :identifier_type
      t.json :download_stats

      t.timestamps null: false
    end

    add_index :author_identifiers, :author_id
    add_index :author_identifiers, [:identifier, :identifier_type], unique: true
  end
end
