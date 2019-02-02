class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.datetime :dt
      t.integer :user_id
      t.integer :chrcnt
      t.integer :kubun

      t.timestamps null: false
    end
  end
end
