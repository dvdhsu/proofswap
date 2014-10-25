class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :link
      t.references :swap, index: true
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
  end
end