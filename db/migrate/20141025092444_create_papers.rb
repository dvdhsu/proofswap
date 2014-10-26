class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :filepicker_url
      t.references :swap, index: true
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
  end
end
