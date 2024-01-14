class CreatePostCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_codes do |t|
      t.integer :post_id
      t.string :position
      t.text :code

      t.timestamps
    end
  end
end
