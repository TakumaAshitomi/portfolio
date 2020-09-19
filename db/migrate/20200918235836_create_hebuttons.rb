class CreateHebuttons < ActiveRecord::Migration[5.2]
  def change
    create_table :hebuttons do |t|

      t.timestamps
    end
  end
end
