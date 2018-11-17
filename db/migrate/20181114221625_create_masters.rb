class CreateMasters < ActiveRecord::Migration
  def change
    create_table :masters do |t|
      t.integer :user_id
      t.string :j
      t.string :e
      t.integer :category_id
      t.string :memo
      t.string :coment
      t.string :fn
      t.datetime :dt
      t.integer :public

      t.timestamps null: false
    end
  end
end
