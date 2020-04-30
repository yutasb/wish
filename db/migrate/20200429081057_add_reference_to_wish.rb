class AddReferenceToWish < ActiveRecord::Migration[5.2]
  def change
    add_reference :wishes, :user, foreign_key: true
    add_reference :wishes, :category, foreign_key: true
  end
end
