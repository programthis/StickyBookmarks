class AddColumnToScenes < ActiveRecord::Migration
  def change
  	add_column :scenes, :book_id, :integer
  end
end
