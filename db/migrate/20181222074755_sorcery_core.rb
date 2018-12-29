class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :screen_name, :null => false

      t.timestamps :null => false
    end

    add_index :users, :screen_name
  end
end
