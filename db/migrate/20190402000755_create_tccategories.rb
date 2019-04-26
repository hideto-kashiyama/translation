class CreateTccategories < ActiveRecord::Migration
  def change
    create_table :tccategories do |t|
      t.string :ctg
      t.integer :bunrui_id

      t.timestamps null: false
    end
  end
end
