class RemoveColumnFromBooks < ActiveRecord::Migration
  def change
  	remove_column :books, :ISBN, :integer
  end
end
