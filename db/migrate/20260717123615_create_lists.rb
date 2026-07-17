class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.timestamps
      t.string :title
      t.string :body
    end
  end
end
