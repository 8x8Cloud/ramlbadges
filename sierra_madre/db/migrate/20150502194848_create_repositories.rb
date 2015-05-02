class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :github_id
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
