class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, :null => false

      t.timestamps :null => false
    end

    add_index :users, :name
  end
end