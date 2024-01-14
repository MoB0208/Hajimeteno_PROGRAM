class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.integer :post_id
      t.string :table_of_content

      t.timestamps
    end
  end
end
