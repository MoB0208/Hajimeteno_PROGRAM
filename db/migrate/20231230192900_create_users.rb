class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :account_name
      t.string :birthdate
      t.string :email
      t.string :password
      t.string :status

      t.timestamps
    end
  end
end
