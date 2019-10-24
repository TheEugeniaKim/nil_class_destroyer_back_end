class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username, limit: 30
      t.string :password

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
