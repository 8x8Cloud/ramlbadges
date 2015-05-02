class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.references :repository
      t.string :commit_sha

      t.timestamps null: false
    end
  end
end
