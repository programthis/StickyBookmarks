class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :ISBN
      t.string :genre

      t.timestamps
    end
  end
end
