class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.datetime :expires
      t.integer :users_count

      t.timestamps
    end
    add_index :swaps, :users_count
  end
end
