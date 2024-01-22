class CreateGenrePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_posts do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
