class ExecutablesPackagesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :executables, :packages do |t|

      t.uuid :executable_id,  null: false
      t.uuid :package_id, null: false

      t.index [:executable_id, :package_id]
      t.index [:package_id, :executable_id]
    end
  end
end
