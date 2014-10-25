class HabtmUsersSwaps < ActiveRecord::Migration
  def change
    create_table :swaps_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :swap
    end

    add_index :swaps_users, [:swap_id, :user_id]
  end
end
