class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :description
      t.integer :likes_counter

      t.timestamps
    end
  end
end
