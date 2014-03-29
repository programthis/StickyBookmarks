class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.integer :chapter
      t.integer :page
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end
