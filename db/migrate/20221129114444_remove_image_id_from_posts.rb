class RemoveImageIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :image_id, :integer
  end
end
