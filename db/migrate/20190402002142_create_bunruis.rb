class CreateBunruis < ActiveRecord::Migration
  def change
    create_table :bunruis do |t|
      t.string :bunrui

      t.timestamps null: false
    end
  end
end
