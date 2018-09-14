class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :text
      t.string :image
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
