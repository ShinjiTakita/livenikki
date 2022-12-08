class ChangeColumnNullOnPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :comment_id, true
  end
end
