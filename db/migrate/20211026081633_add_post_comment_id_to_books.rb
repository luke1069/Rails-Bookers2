class AddPostCommentIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :post_comment_id, :integer
  end
end
