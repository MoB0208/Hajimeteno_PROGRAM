class CreatePostRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :post_relationships do |t|
      t.integer :post_id
      t.integer :relation_post_id

      t.timestamps
    end
  end
end
