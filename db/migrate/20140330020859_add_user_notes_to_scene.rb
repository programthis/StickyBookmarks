class AddUserNotesToScene < ActiveRecord::Migration
  def change
  	add_column :scenes, :notes, :string
  end
end
