class CreatePostCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_codes do |t|
      t.integer :post_id
      t.string :code
      t.text :body

      t.timestamps
    end
  end
end
