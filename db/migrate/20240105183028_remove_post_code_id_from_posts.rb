class RemovePostCodeIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :post_code_id, :integer
  end
end
