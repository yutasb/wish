class AddColumnToWish < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :done_flg, :boolean, default: false
  end
end
