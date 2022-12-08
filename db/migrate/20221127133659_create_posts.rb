class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :tag_id, null: false
      t.integer :customer_id, null: false
      t.integer :comment_id, null: false
      t.string :title, null: false
      t.text :body, null:false
      t.string :setlist, null: false
      t.string :venue, null: false
      t.integer :image_id, null: false

      t.timestamps
    end
  end
end
