class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.datetime :expires

      t.timestamps
    end
  end
end
