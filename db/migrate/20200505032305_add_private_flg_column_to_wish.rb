class AddPrivateFlgColumnToWish < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :private_flg, :boolean, :default => 'false'
  end
end
