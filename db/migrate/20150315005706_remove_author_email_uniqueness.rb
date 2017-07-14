class RemoveAuthorEmailUniqueness < ActiveRecord::Migration
  def change
    # remove_index :authors, name: :index_authors_on_email
  end
end
