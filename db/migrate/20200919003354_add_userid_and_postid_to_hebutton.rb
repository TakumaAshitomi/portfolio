class AddUseridAndPostidToHebutton < ActiveRecord::Migration[5.2]
  def change
    add_column :hebuttons, :user_id, :integer
    add_column :hebuttons, :post_id, :integer
  end
end
