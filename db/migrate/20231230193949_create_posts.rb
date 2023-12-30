class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :genre_id
      t.integer :post_code_id
      t.string :title
      t.string :main_code

      t.timestamps
    end
  end
end
