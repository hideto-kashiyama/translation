class CreateTcmasters < ActiveRecord::Migration
  def change
    create_table :tcmasters do |t|
      t.string :j
      t.string :e
      t.integer :tccategory_id
      t.integer :bunrui_id
      t.string :memo
      t.integer :s_category_id
      t.integer :kubun

      t.timestamps null: false
    end
  end
end
