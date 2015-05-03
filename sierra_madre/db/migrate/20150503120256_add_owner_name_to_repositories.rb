class AddOwnerNameToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :owner_name, :string
  end
end
