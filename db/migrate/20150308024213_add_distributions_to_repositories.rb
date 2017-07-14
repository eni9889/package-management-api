class AddDistributionsToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :distributions, :json
  end
end
