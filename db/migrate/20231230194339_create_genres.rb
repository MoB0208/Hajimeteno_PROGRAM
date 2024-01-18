class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.integer :post_id
      t.integer :genre_name
      t.string :version

      t.timestamps
    end
  end
end
