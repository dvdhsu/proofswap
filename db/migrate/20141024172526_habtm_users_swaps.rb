class HabtmUsersSwaps < ActiveRecord::Migration
  def change
    create_table :swaps_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :swap
    end
  end
end
