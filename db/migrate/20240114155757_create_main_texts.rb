class CreateMainTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :main_texts do |t|
      t.integer :post_id
      t.text :body

      t.timestamps
    end
  end
end
