class AddUserIdAndFollowedId < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :user_id, :integer
    add_column :subscriptions, :followed_id, :integer
  end
end
