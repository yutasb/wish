class ChangeColumnToRelationship < ActiveRecord::Migration[5.2]
  def up
    rename_column :relationships, :user_id, :following_id
    rename_column :relationships, :follow_id, :follower_id
  end
  def down
    rename_column :relationships, :following_id, :user_id
    rename_column :relationships, :follower_id, :follow_id
  end
end
