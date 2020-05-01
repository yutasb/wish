class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :image, :string
    remove_column :users, :prof_img
  end
  def down
    remove_column :users, :image
    add_column :users, :prof_img, :string
  end
end
