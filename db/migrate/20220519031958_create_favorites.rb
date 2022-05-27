class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id, foreign_key: true
      t.integer :post_id, foreign_key: true

      t.timestamps
      t.index [:user_id, :item_id], unique: true
    end
  end
end
