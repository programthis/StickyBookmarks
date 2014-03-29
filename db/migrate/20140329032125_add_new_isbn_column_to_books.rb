class AddNewIsbnColumnToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :ISBN, :integer, :limit => 8
  end
end
