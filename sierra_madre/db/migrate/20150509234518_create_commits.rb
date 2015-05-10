class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.text :message
      t.datetime :timestamp
      t.string :url
      t.references :repository, index: true

      t.timestamps null: false
    end
    add_foreign_key :commits, :repositories
  end
end
